import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/authentication/models/restaurant_model.dart';
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
  init() {}

  @observable
  ObservableList<OrderModel> activeOrders = ObservableList.of([]);

  final OrdersService service = OrdersService();
  bool get isRestaurantPreferredHe => RestaurantModel.fromJson(
          localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
      .wantDeliveryFromUs;

  Future<bool> getActiveOrders() async {
    final List<OrderModel>? response = await service.getActiveOrders(
        localeManager.getStringData(LocaleKeysEnums.id.name), accessToken!);
    if (response == null) {
      showErrorDialog();
      return false;
    }
    activeOrders = ObservableList.of(response);
    return true;
  }

  String parseIso8601DateFormatDetailed(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    String hourFormat = DateFormat('HH.mm').format(dateTime);
    String dateFormat = DateFormat('dd.MM.yyyy').format(dateTime);
    return "$hourFormat - $dateFormat";
  }
}
