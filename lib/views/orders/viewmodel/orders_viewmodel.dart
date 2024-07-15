import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/core/init/model/http_exception_model.dart';
import 'package:haydi_express_restaurant/core/managers/web_socket_manager.dart';
import 'package:haydi_express_restaurant/views/authentication/models/restaurant_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/bucket_element_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_states.dart';
import 'package:haydi_express_restaurant/views/orders/service/orders_service.dart';
import 'package:intl/intl.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'orders_viewmodel.g.dart';

class OrdersViewModel = _OrdersViewModelBase with _$OrdersViewModel;

abstract class _OrdersViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() async {
    _listenOrderChannel();
    await localeManager.setBoolData(LocaleKeysEnums.isOrderGot.name, false);
  }

  @observable
  ObservableList<OrderModel> activeOrders = ObservableList.of([]);

  final OrdersService service = OrdersService();
  bool get isRestaurantPreferredHe => RestaurantModel.fromJson(
          localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
      .wantDeliveryFromUs;

  Future<bool> getActiveOrders() async {
    //Every screen size changes this function triggering.
    //So this check saves api from over requests
    if (!localeManager.getBoolData(LocaleKeysEnums.isOrderGot.name)) {
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
      await localeManager.setBoolData(LocaleKeysEnums.isOrderGot.name, true);
      return true;
    } else {
      return true;
    }
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
}
