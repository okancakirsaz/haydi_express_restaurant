import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/models/models_index.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/core/managers/web_socket_manager.dart';
import 'package:haydi_express_restaurant/views/chat/view/chat_view.dart';
import 'package:haydi_express_restaurant/views/create_order/view/create_order_view.dart';
import 'package:haydi_express_restaurant/views/orders/service/orders_service.dart';
import 'package:haydi_express_restaurant/views/orders/view/orders_view.dart';
import 'package:intl/intl.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'orders_viewmodel.g.dart';

class OrdersViewModel = _OrdersViewModelBase with _$OrdersViewModel;

abstract class _OrdersViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    _listenOrderChannel();
  }

  @observable
  ObservableList<OrderModel> activeOrders = ObservableList.of([]);

  @observable
  ObservableList<OrderModel> orderLogs = ObservableList.of([]);

  bool isOrdersGot = false;
  bool isLogsGot = false;

  @observable
  int orderLogCount = 0;

  @observable
  int totalRevenue = 0;

  @observable
  ObservableList<String> selectedTimeRange = ObservableList.of([]);

  final TextEditingController cancelReason = TextEditingController();

  final OrdersService service = OrdersService();
  bool get isRestaurantPreferredHe => RestaurantModel.fromJson(
          localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
      .wantDeliveryFromUs;

  String get _restaurantCreationDate => RestaurantModel.fromJson(
          localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
      .accountCreationDate;

  Future<bool> getActiveOrders() async {
    //Every screen size changes this function triggering.
    //So this check saves api from over requests
    if (!isOrdersGot) {
      final List<OrderModel>? response = await service.getActiveOrders(
          localeManager.getStringData(LocaleKeysEnums.id.name), accessToken!);
      if (response == null) {
        showErrorDialog();
        return false;
      }
      activeOrders = ObservableList.of(response);
      for (OrderModel order in activeOrders) {
        _listenOrderStateUpdate(order);
      }
      isOrdersGot = true;
      return true;
    } else {
      return true;
    }
  }

  @action
  Future<bool> getOrderLogs() async {
    //Every screen size changes this function triggering.
    //So this check saves api from over requests
    if (!isLogsGot) {
      final List<OrderModel>? response = await service.getOrderLogs(
          localeManager.getStringData(LocaleKeysEnums.id.name),
          selectedTimeRange.isEmpty
              ? [_restaurantCreationDate, DateTime.now().toIso8601String()]
              : selectedTimeRange,
          accessToken!);
      if (response == null) {
        showErrorDialog();
        return false;
      }
      orderLogs = ObservableList.of(response.isEmpty ? [] : response);
      isLogsGot = true;
      orderLogCount = orderLogs.length;
      totalRevenue = _calculateTotalCount;
      return true;
    } else {
      return true;
    }
  }

  int get _calculateTotalCount {
    List<BucketElementModel> menus = [];
    if (orderLogs.isNotEmpty) {
      for (OrderModel order in orderLogs) {
        if (order.orderState.asOrderState != Cancelled.instance) {
          menus += order.menuData;
        }
      }
    }
    final List<int> priceList = menus
        .map(
          (e) =>
              e.count *
              (e.menuElement.isOnDiscount
                  ? calculateDiscount(
                      e.menuElement.price, e.menuElement.discountAmount!)
                  : e.menuElement.price),
        )
        .toList();
    //If priceList empty reduce function throws error
    return priceList.isNotEmpty ? priceList.reduce((a, b) => a + b) : 0;
  }

  String parseIso8601DateFormatDetailed(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    String hourFormat = DateFormat('HH.mm').format(dateTime);
    String dateFormat = DateFormat('dd.MM.yyyy').format(dateTime);
    return "$hourFormat - $dateFormat";
  }

  @action
  _listenOrderChannel() {
    WebSocketManager.instance.webSocketReceiver(
      "New Order:${localeManager.getStringData(LocaleKeysEnums.id.name)}",
      (e) {
        final OrderModel asModel = OrderModel.fromJson(e);
        activeOrders.add(asModel);
        //Listen order state update process
        _listenOrderStateUpdate(asModel);
      },
    );
  }

  @action
  _listenOrderStateUpdate(OrderModel data) {
    if (isRestaurantPreferredHe) {
      WebSocketManager.instance.webSocketReceiver(data.orderId, (newOrder) {
        final OrderModel asModel = OrderModel.fromJson(newOrder);
        int index =
            activeOrders.indexWhere((e) => e.orderId == asModel.orderId);
        if (_checkOrderIsDeliveredOrCancelled(
            asModel.orderState.asOrderState)) {
          WebSocketManager.instance.closeEvent(asModel.orderId);
        }

        activeOrders.removeAt(index);
        activeOrders.insert(index, asModel);
      });
    }
  }

  String fetchMenuPrice(BucketElementModel bucketElement) {
    return "${bucketElement.menuElement.isOnDiscount ? calculateDiscount(bucketElement.menuElement.price, bucketElement.menuElement.discountAmount!) : (bucketElement.menuElement.price * bucketElement.count)}₺";
  }

  Future<void> fetchNewOrderStateToDb(OrderModel data, int index) async {
    OrderState oldOrderState = data.orderState.asOrderState;
    data.orderState = _fetchNextOrderState(data.orderState.asOrderState);
    final dynamic response = await service.updateOrderState(data, accessToken!);
    if (response == null) {
      showErrorDialog();
      return;
    }
    if (response is HttpExceptionModel) {
      showErrorDialog(response.message);
      return;
    }

    changeOrderState(oldOrderState, index);
  }

  @action
  changeOrderState(OrderState currentOrderState, int index) {
    final OrderModel changedOrder = activeOrders[index];
    changedOrder.orderState = _fetchNextOrderState(currentOrderState);
    activeOrders.removeAt(index);
    activeOrders.insert(index, changedOrder);
    if (_checkOrderIsDeliveredOrCancelled(currentOrderState)) {
      activeOrders.removeAt(index);
    }
  }

  bool _checkOrderIsDeliveredOrCancelled(OrderState orderState) {
    if (orderState == PackageDelivered.instance ||
        orderState == Cancelled.instance) {
      return true;
    } else {
      return false;
    }
  }

  _fetchNextOrderState(OrderState currentOrderState) {
    if (isRestaurantPreferredHe &&
        currentOrderState == WaitingRestaurantAccept.instance) {
      return WaitingCourierAttachment.instance.text;
    }
    if (currentOrderState == WaitingRestaurantAccept.instance) {
      return Preparing.instance.text;
    }
    if (currentOrderState == Preparing.instance) {
      return PackageIsOnWay.instance.text;
    }
    if (currentOrderState == PackageIsOnWay.instance) {
      return PackageDelivered.instance.text;
    } else {
      return currentOrderState.text;
    }
  }

  openOrderCancelDialog(OrdersViewModel viewModel, OrderModel data) {
    showDialog(
      context: viewModelContext,
      builder: (context) => CancelReasonDialog(
        viewModel: viewModel,
        data: data,
      ),
    );
  }

  @action
  Future<void> cancelOrder(OrderModel data) async {
    if (_isOrderSuitableToCancel(data.orderState.asOrderState)) {
      data.orderState = Cancelled.instance.text;
      final dynamic response = await service.cancelOrder(
          CancelOrderModel(
            order: data,
            reason: cancelReason.text,
          ),
          accessToken!);
      if (response == null) {
        showErrorDialog();
        return;
      }
      if (response is HttpExceptionModel) {
        showErrorDialog(response.message);
        return;
      }

      changeOrderState(
        data.orderState.asOrderState,
        activeOrders.indexWhere((e) => e.orderId == data.orderId),
      );
    }
    //Close dialog
    navigatorPop();
  }

  bool _isOrderSuitableToCancel(OrderState state) {
    if (state == CourierIsOnWay.instance ||
        state == PackageIsOnWay.instance ||
        state == PackageDelivered.instance) {
      showErrorDialog(state.text);
      return false;
    } else {
      return true;
    }
  }

  @action
  Future<void> pickDate() async {
    selectedTimeRange.clear();

    final DateTimeRange? range = await showDateRangePicker(
      context: viewModelContext,
      firstDate: DateTime.parse(_restaurantCreationDate),
      currentDate: DateTime.now(),
      helpText: "Tarih aralığı seçiniz",
      saveText: "Kaydet",
      cancelText: "İptal",
      confirmText: "Onayla",
      fieldEndHintText: "Bitiş tarihi",
      fieldStartHintText: "Başlangıç tarihi",
      fieldEndLabelText: "Bitiş tarihi",
      fieldStartLabelText: "Başlangıç tarihi",
      lastDate: DateTime.now(),
    );

    if (range != null) {
      isLogsGot = false;
      selectedTimeRange.add(range.start.toIso8601String());
      final DateTime endDate = range.end.copyWith(hour: 23, minute: 59);
      selectedTimeRange.add(endDate.toIso8601String());
      await getOrderLogs();
    }
  }

  navigateToCreateOrder() =>
      navigationManager.navigate(const CreateOrderView());

  showChatDialog(OrderModel data) {
    showDialog(
      context: viewModelContext,
      builder: (context) => Center(
        child: ChatView(
          isContactingWithCustomer: true,
          targetId: data.customerId,
          targetName: data.customerName,
        ),
      ),
    );
  }
}
