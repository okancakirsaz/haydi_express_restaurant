import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/models/restaurant_model.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/adversiment/adversiment_parent_view/view/adversiment_parent_view.dart';
import 'package:haydi_express_restaurant/views/authentication/log_in/view/log_in_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'profile_viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    restaurantData = RestaurantModel.fromJson(
        localeManager.getJsonData(LocaleKeysEnums.restaurantData.name));
  }

  late final RestaurantModel restaurantData;

  Future<void> signOut() async {
    await localeManager.removeData(LocaleKeysEnums.accessToken.name);
    await localeManager.removeData(LocaleKeysEnums.id.name);
    await localeManager.removeData(LocaleKeysEnums.restaurantData.name);
    await localeManager.removeData(LocaleKeysEnums.activeConversations.name);
    navigationManager.navigateAndRemoveUntil(const LogInView());
  }

  dynamic get navigateToAds => navigationManager.navigate(
        const AdvertisementParentView(),
      );
}
