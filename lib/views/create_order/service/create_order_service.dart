import 'package:dio/dio.dart';
import 'package:haydi_ekspres_dev_tools/constants/endpoints.dart';
import 'package:haydi_ekspres_dev_tools/models/http_exception_model.dart';
import 'package:haydi_ekspres_dev_tools/models/order_model.dart';
import '../../../core/managers/network_manager.dart';

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
