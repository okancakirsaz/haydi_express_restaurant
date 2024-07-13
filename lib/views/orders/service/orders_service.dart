import 'package:dio/dio.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_model.dart';

import '../../../core/consts/endpoints.dart';

final class OrdersService extends NetworkManager {
  Future<List<OrderModel>?> getActiveOrders(
      String restaurantId, String accessToken) async {
    try {
      final response = await network.get(
        Endpoints.instance.getActiveOrders,
        queryParameters: {"restaurantId": restaurantId},
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      return (response.data as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();
    } catch (e) {
      return null;
    }
  }
}
