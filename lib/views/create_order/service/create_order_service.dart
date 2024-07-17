import 'package:dio/dio.dart';

import '../../../core/consts/endpoints.dart';
import '../../../core/init/model/http_exception_model.dart';
import '../../../core/managers/network_manager.dart';
import '../../orders/model/order_model.dart';

final class CreateOrderService extends NetworkManager {
  Future<dynamic> createOrder(OrderModel data, String accessToken) async {
    try {
      final response = await network.post(
        Endpoints.instance.createOrder,
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
