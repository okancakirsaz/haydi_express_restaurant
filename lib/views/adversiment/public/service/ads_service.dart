import 'package:dio/dio.dart';
import 'package:haydi_ekspres_dev_tools/constants/endpoints.dart';
import 'package:haydi_ekspres_dev_tools/models/boost_menu_or_restaurant_model.dart';
import 'package:haydi_ekspres_dev_tools/models/http_exception_model.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';

final class AdsService extends NetworkManager {
  Future<HttpExceptionModel?> getBoost(
      BoostRestaurantOrMenuModel data, String accessToken) async {
    try {
      final response = await network.post(
        Endpoints.instance.getBoost,
        data: data.toJson(),
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      return HttpExceptionModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<int?> getSearchAdsLength(String accessToken) async {
    try {
      final response = await network.get(
        Endpoints.instance.getSearchAds,
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      return response.data.length;
    } catch (e) {
      return null;
    }
  }
}
