import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haydi_ekspres_dev_tools/models/billing_model.dart';
import 'package:haydi_ekspres_dev_tools/models/restaurant_model.dart';
import 'package:haydi_ekspres_dev_tools/models/work_hours_model.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/stats/service/stats_service.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'stats_viewmodel.g.dart';

class StatsViewModel = _StatsViewModelBase with _$StatsViewModel;

abstract class _StatsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    _initWorkHours();
  }

  final StatsService service = StatsService();
  final TextEditingController startHour = TextEditingController();
  final TextEditingController startMinute = TextEditingController();
  final TextEditingController endHour = TextEditingController();
  final TextEditingController endMinute = TextEditingController();

  RestaurantModel get restaurantData => RestaurantModel.fromJson(
      localeManager.getJsonData(LocaleKeysEnums.restaurantData.name));

  bool get isRestaurantCreationOverSixMonths {
    final DateTime creationDate =
        DateTime.parse(restaurantData.accountCreationDate);
    final DateTime now = DateTime.now();
    Duration difference = now.difference(creationDate).abs();
    int monthsDifference = (difference.inDays / 30).floor();
    return monthsDifference >= 6;
  }

  _initWorkHours() {
    final WorkHoursModel data = RestaurantModel.fromJson(
            localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
        .workHours;
    startHour.text = data.startHour.toString();
    startMinute.text = data.startMinute.toString();
    endHour.text = data.endHour.toString();
    endMinute.text = data.endMinute.toString();
  }

  Future<void> setNewWorkHours() async {
    final bool? response = await service.setWorkHours(_fetchModel,
        localeManager.getStringData(LocaleKeysEnums.id.name), accessToken!);
    if (response == null || response == false) {
      showErrorDialog();
      return;
    }
    await _updateWorkHoursInCache();
  }

  Future<void> _updateWorkHoursInCache() async {
    final RestaurantModel data = restaurantData;
    data.workHours = _fetchModel;
    await localeManager.setJsonData(LocaleKeysEnums.restaurantData.name, data);
  }

  String get fetchPaymentDateText {
    if (restaurantData.lastPaymentDate == null) {
      return "${parseIso8601DateFormat(restaurantData.nextPaymentDate!)} tarihinde tahsil edilecek:";
    }
    return "${parseIso8601DateFormat(restaurantData.lastPaymentDate!)} - ${parseIso8601DateFormat(restaurantData.nextPaymentDate!)} tarihleri arasında:";
  }

  WorkHoursModel get _fetchModel {
    final int startH = int.parse(startHour.text);
    final int startM = int.parse(startMinute.text);
    final int endH = int.parse(endHour.text);
    final int endM = int.parse(endMinute.text);
    return WorkHoursModel(
      startHour: startH,
      startMinute: startM,
      endHour: endH,
      endMinute: endM,
    );
  }

  Future<List<BillingModel>> getOldBillings() async {
    final List<BillingModel>? response = await service.getRestaurantOldBills(
        localeManager.getStringData(LocaleKeysEnums.id.name), accessToken!);
    if (response == null) {
      showErrorDialog();
      return [];
    }
    return response;
  }
}
