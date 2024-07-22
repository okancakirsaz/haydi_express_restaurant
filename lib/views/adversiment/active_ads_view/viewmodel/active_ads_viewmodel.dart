import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/models/models_index.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/adversiment/active_ads_view/service/active_ads_service.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'active_ads_viewmodel.g.dart';

class ActiveAdsViewModel = _ActiveAdsViewModelBase with _$ActiveAdsViewModel;

abstract class _ActiveAdsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  final ActiveAdsService service = ActiveAdsService();

  Future<List<BoostRestaurantOrMenuModel>> getActiveAds() async {
    final List<BoostRestaurantOrMenuModel>? response =
        await service.getOrderLogs(
            localeManager.getStringData(LocaleKeysEnums.id.name), accessToken!);
    if (response == null) {
      showErrorDialog();
      return [];
    }
    return response;
  }
}
