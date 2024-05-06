import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/authentication/models/restaurant_model.dart';
import 'package:haydi_express_restaurant/views/menu_view/view/menu_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'main_viewmodel.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    restaurantName = RestaurantModel.fromJson(
            localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
        .businessName;
  }

  @observable
  Widget page = const MenuView();

  String restaurantName = "Restaurant Name";

  @action
  changePage(Widget newPage) {
    page = newPage;
  }
}
