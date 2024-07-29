import 'package:haydi_ekspres_dev_tools/constants/endpoints.dart';
import 'package:haydi_ekspres_dev_tools/models/restaurant_model.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';
import 'package:dio/dio.dart';

final class InitService extends NetworkManager {
  Future<RestaurantModel?> getRestaurantData(
      String restaurantId, String accessToken) async {
    try {
      final response = await network.get(
        Endpoints.instance.getRestaurantAllData,
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
        queryParameters: {"restaurantId": restaurantId},
      );
      return RestaurantModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
