import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/adversiment/public/model/boost_menu_or_restaurant_model.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

import '../../../menu_view/models/menu_model.dart';
import '../../public/service/ads_service.dart';

part 'get_ads_viewmodel.g.dart';

class GetAdsViewModel = _GetAdsViewModelBase with _$GetAdsViewModel;

abstract class _GetAdsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    _initMenu();
  }

  final AdsService service = AdsService();

  List<MenuModel> restaurantMenu = [];
  final TextEditingController boostArea = TextEditingController();
  final TextEditingController pickedMenu = TextEditingController();
  String? selectedExpireDate;

  _initMenu() {
    List<dynamic> cachedMenu =
        localeManager.getNullableJsonData(LocaleKeysEnums.menu.name) ?? [];
    restaurantMenu = cachedMenu.map((e) => MenuModel.fromJson(e)).toList();
  }

  List<DropdownMenuEntry> get fetchMenuAsDropDownEntryList {
    return restaurantMenu.map((e) {
      return DropdownMenuEntry(value: e.name, label: e.name);
    }).toList();
  }

  Future<void> openDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: viewModelContext,
      firstDate: DateTime.now(),
      lastDate: DateTime(2300),
      currentDate: DateTime.now(),
    );
    if (selectedDate != null) {
      selectedExpireDate = selectedDate.toIso8601String();
    }
  }

  Future<void> getBoost() async {
    if (!_boostValidation) {
      return;
    }

    final bool? response =
        await service.getBoost(_fetchBoostData, accessToken!);

    if (response == null || !response) {
      showErrorDialog();
      return;
    }
    showSuccessDialog();
  }

  bool get _boostValidation {
    if (boostArea.text.isEmpty ||
        pickedMenu.text.isEmpty ||
        selectedExpireDate == null) {
      showErrorDialog("Lütfen istenilen bilgileri eksiksiz giriniz.");
      return false;
    } else {
      return true;
    }
  }

  BoostRestaurantOrMenuModel get _fetchBoostData => BoostRestaurantOrMenuModel(
        //TODO:Add isRestaurant check
        expireDate: selectedExpireDate!,
        elementId: _getMenuIdFromMenuName,
        boostArea: boostArea.text,
        restaurantId: localeManager.getStringData(LocaleKeysEnums.id.name),
        isRestaurant: false,
      );

  String get _getMenuIdFromMenuName {
    final MenuModel selectedMenu = restaurantMenu
        .where((element) => element.name == pickedMenu.text)
        .first;
    return selectedMenu.menuId;
  }
}
