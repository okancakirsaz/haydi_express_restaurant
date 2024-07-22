import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/models/boost_menu_or_restaurant_model.dart';
import 'package:haydi_ekspres_dev_tools/models/http_exception_model.dart';
import 'package:haydi_ekspres_dev_tools/models/menu_model.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/consts/get_ads_texts.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/view/get_ads_view.dart';
import 'package:haydi_express_restaurant/views/adversiment/public/const/ad_types.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';
import '../../public/service/ads_service.dart';

part 'get_ads_viewmodel.g.dart';

//TODO: Do payment part
class GetAdsViewModel = _GetAdsViewModelBase with _$GetAdsViewModel;

abstract class _GetAdsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() async {
    content = MenuBoost(viewModel: _vmInstance);
    _initMenu();
    _getBoostAreaInfo();
    await _getSearchAdsLength();
  }

  final AdsService service = AdsService();

  initVm(GetAdsViewModel model) => _vmInstance = model;

  late GetAdsViewModel _vmInstance;

  List<MenuModel> restaurantMenu = [];
  bool isRestaurantBoosting = false;
  final TextEditingController boostArea = TextEditingController();
  final TextEditingController pickedMenu = TextEditingController();
  String? selectedExpireDate;

  @observable
  Widget? content;

  @observable
  Widget? info;

  @observable
  String title = GetAdsTexts.instance.menuBoostTitle;

  @observable
  String buttonText = GetAdsTexts.instance.boostRestaurant;

  @observable
  String description = "";

  List<DropdownMenuEntry> boostAreas = [
    DropdownMenuEntry(
      value: AdTypes.instance.haydiFirsatlar,
      label: AdTypes.instance.haydiFirsatlar,
    ),
    DropdownMenuEntry(
      value: AdTypes.instance.suggestions,
      label: AdTypes.instance.suggestions,
    ),
  ];

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

  @action
  changeContent() {
    if (isRestaurantBoosting) {
      content = MenuBoost(viewModel: _vmInstance);
      isRestaurantBoosting = false;
      title = GetAdsTexts.instance.menuBoostTitle;
      buttonText = GetAdsTexts.instance.boostRestaurant;
    } else {
      content = RestaurantBoost(viewModel: _vmInstance);
      isRestaurantBoosting = true;
      title = GetAdsTexts.instance.restaurantBoostTitle;
      buttonText = GetAdsTexts.instance.boostMenu;
    }
    _resetInputs();
  }

  Future<void> _getSearchAdsLength() async {
    final int? response = await service.getSearchAdsLength(accessToken!);
    if (response == null) {
      showErrorDialog();
      return;
    }
    if (response >= 5) {
      boostAreas.removeAt(1);
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
    _resetInputs();
  }

  bool get _boostValidation {
    if (boostArea.text.isEmpty ||
        selectedExpireDate == null ||
        selectedExpireDate!.isEmpty ||
        (!isRestaurantBoosting && pickedMenu.text.isEmpty)) {
      showErrorDialog("Lütfen gerekli yerleri doldurunuz.");
      return false;
    } else {
      return true;
    }
  }

  String get restaurantId =>
      localeManager.getStringData(LocaleKeysEnums.id.name);

  BoostRestaurantOrMenuModel get _fetchBoostData => BoostRestaurantOrMenuModel(
        expireDate: selectedExpireDate!,
        elementId: isRestaurantBoosting ? restaurantId : _getMenuIdFromMenuName,
        boostArea: boostArea.text,
        restaurantId: restaurantId,
        menuName: pickedMenu.text.isNotEmpty ? pickedMenu.text : null,
        isRestaurant: isRestaurantBoosting,
      );

  String get _getMenuIdFromMenuName {
    final MenuModel selectedMenu = restaurantMenu
        .where((element) => element.name == pickedMenu.text)
        .first;
    return selectedMenu.menuId;
  }

  @action
  _getBoostAreaInfo() {
    boostArea.addListener(() {
      if (boostArea.text == AdTypes.instance.haydiFirsatlar) {
        info = const HaydiFirsatlarInfo();
        return;
      }
      if (boostArea.text == AdTypes.instance.suggestions) {
        info = const SuggestionsInfo();
        return;
      }
    });
  }

  _resetInputs() {
    boostArea.text = "";
    pickedMenu.text = "";
    info = null;
    selectedExpireDate = null;
  }
}
