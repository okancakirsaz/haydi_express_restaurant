import 'package:dio/dio.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';
import 'package:haydi_express_restaurant/views/adversiment/public/model/boost_menu_model.dart';

import '../../../../core/consts/endpoints.dart';

final class AdsService extends NetworkManager {
  Future<bool?> getBoost(BoostMenuModel data, String accessToken) async {
    try {
      final response = await network.post(
        Endpoints.instance.getBoost,
        data: data.toJson(),
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      return bool.parse(response.data);
    } catch (e) {
      return null;
    }
  }
}
