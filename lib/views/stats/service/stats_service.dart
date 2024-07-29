import 'package:haydi_ekspres_dev_tools/constants/endpoints.dart';
import 'package:haydi_ekspres_dev_tools/models/billing_model.dart';
import 'package:haydi_ekspres_dev_tools/models/work_hours_model.dart';
import 'package:haydi_express_restaurant/core/managers/network_manager.dart';
import 'package:dio/dio.dart';

final class StatsService extends NetworkManager {
  Future<bool?> setWorkHours(
      WorkHoursModel data, String restaurantId, String accessToken) async {
    try {
      final response = await network.post(
        Endpoints.instance.setRestaurantWorkHours,
        data: data.toJson(),
        queryParameters: {"restaurantId": restaurantId},
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
      );
      return bool.parse(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<List<BillingModel>?> getRestaurantOldBills(
      String restaurantId, String accessToken) async {
    try {
      final response = await network.get(
        Endpoints.instance.getRestaurantOldBillings,
        options: Options(
          headers: setHeaderAccessToken(accessToken),
        ),
        queryParameters: {"restaurantId": restaurantId},
      );
      List<BillingModel> dataList = [];
      for (int i = 0; i <= response.data.length - 1; i++) {
        dataList.add(BillingModel.fromJson(response.data[i]));
      }
      return dataList;
    } catch (e) {
      return null;
    }
  }
}
