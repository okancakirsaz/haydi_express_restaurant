import 'package:haydi_ekspres_dev_tools/constants/endpoints.dart';
import 'package:haydi_ekspres_dev_tools/models/log_in_restaurant_model.dart';
import '../../../../core/managers/network_manager.dart';

final class LogInService extends NetworkManager {
  Future<LogInRestaurantModel?> logIn(LogInRestaurantModel data) async {
    try {
      final response = await network.post(Endpoints.instance.logInRestaurant,
          data: data.toJson());
      return LogInRestaurantModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
