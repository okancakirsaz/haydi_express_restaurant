import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/models/boost_menu_or_restaurant_model.dart';
import 'package:haydi_ekspres_dev_tools/models/http_exception_model.dart';
import 'package:haydi_ekspres_dev_tools/models/menu_model.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';
import '../../public/service/ads_service.dart';

part 'get_ads_viewmodel.g.dart';

class GetAdsViewModel = _GetAdsViewModelBase with _$GetAdsViewModel;

abstract class _GetAdsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() async {
    _initMenu();
    await _getSearchAdsLength();
  }

  final AdsService service = AdsService();

  List<MenuModel> restaurantMenu = [];
  bool isRestaurantBoosting = false;
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

  Future<void> _getSearchAdsLength() async {
    final int? response = await service.getSearchAdsLength(accessToken!);
    if (response == null) {
      showErrorDialog();
      return;
    }
    if (response >= 5) {
      //TODO: Close suggestion ads and edit text
      showErrorDialog("Arama Önerileri Kısmı Şuan Reklam İçin Açık Değil");
    }
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

    final HttpExceptionModel? response =
        await service.getBoost(_fetchBoostData, accessToken!);

    if (response == null) {
      showErrorDialog();
      return;
    }
    showSuccessDialog(response.message);
  }

  bool get _boostValidation {
    //TODO: Do validation
    return true;
  }

  String get restaurantId =>
      localeManager.getStringData(LocaleKeysEnums.id.name);

  BoostRestaurantOrMenuModel get _fetchBoostData => BoostRestaurantOrMenuModel(
        expireDate: selectedExpireDate!,
        elementId: isRestaurantBoosting ? restaurantId : _getMenuIdFromMenuName,
        boostArea: boostArea.text,
        restaurantId: restaurantId,
        isRestaurant: isRestaurantBoosting,
      );

  String get _getMenuIdFromMenuName {
    final MenuModel selectedMenu = restaurantMenu
        .where((element) => element.name == pickedMenu.text)
        .first;
    return selectedMenu.menuId;
  }
}
