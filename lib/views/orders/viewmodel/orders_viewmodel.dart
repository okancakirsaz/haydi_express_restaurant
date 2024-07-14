import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/core/managers/web_socket_manager.dart';
import 'package:haydi_express_restaurant/views/authentication/models/restaurant_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/bucket_element_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_model.dart';
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
      (e) => activeOrders.add(OrderModel.fromJson(e)),
    );
  }

  String fetchMenuPrice(BucketElementModel bucketElement) {
    return "${bucketElement.menuElement.isOnDiscount ? calculateDiscount(bucketElement.menuElement.price, bucketElement.menuElement.discountAmount!) : (bucketElement.menuElement.price * bucketElement.count)}₺";
  }
}
