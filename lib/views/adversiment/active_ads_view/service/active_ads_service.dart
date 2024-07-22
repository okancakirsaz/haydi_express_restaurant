import 'package:haydi_ekspres_dev_tools/constants/endpoints.dart';
import 'package:haydi_ekspres_dev_tools/models/boost_menu_or_restaurant_model.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';
import 'package:dio/dio.dart';

final class ActiveAdsService extends NetworkManager {
  Future<List<BoostRestaurantOrMenuModel>?> getOrderLogs(
      String restaurantId, String accessToken) async {
    try {
      final response = await network.get(
        Endpoints.instance.activeBoosts,
        queryParameters: {
          "restaurantId": restaurantId,
        },
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      List asList = (response.data as List);
      if (asList.isEmpty) {
        return [];
      } else {
        return asList
            .map((e) => BoostRestaurantOrMenuModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      return null;
    }
  }
}
