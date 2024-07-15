import 'package:dio/dio.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_model.dart';

import '../../../core/consts/endpoints.dart';
import '../../../core/init/model/http_exception_model.dart';

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

  Future<dynamic> updateOrderState(OrderModel data, String accessToken) async {
    try {
      final response = await network.post(
        Endpoints.instance.updateOrderState,
        data: data.toJson(),
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      if (response.data != "true") {
        return HttpExceptionModel.fromJson(response.data);
      } else {
        return bool.parse(response.data);
      }
    } catch (e) {
      return null;
    }
  }
}
