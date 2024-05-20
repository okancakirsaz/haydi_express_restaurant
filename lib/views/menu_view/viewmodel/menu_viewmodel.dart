import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/consts/app_consts.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/main_view.dart/view/main_view.dart';
import 'package:haydi_express_restaurant/views/menu_view/models/add_campaign_model.dart';
import 'package:haydi_express_restaurant/views/menu_view/models/menu_model.dart';
import 'package:haydi_express_restaurant/views/menu_view/models/menu_stats_model.dart';
import 'package:haydi_express_restaurant/views/menu_view/service/menu_service.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';
import '../view/menu_view.dart';

part 'menu_viewmodel.g.dart';

//TODO: Add cached menu algorithm after 1.0 release
class MenuViewModel = _MenuViewModelBase with _$MenuViewModel;

abstract class _MenuViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() async {}

  final MenuService service = MenuService();
  final TextEditingController menuName = TextEditingController();
  final TextEditingController menuPrice = TextEditingController();
  final TextEditingController menuContent = TextEditingController();
  final TextEditingController tag = TextEditingController();
  Uint8List? menuImage;

  @observable
  Widget createOrPreviewMenuWidget = const SizedBox();

  @observable
  Widget campaignWidget = const SizedBox();

  @observable
  String campaignButtonText = "Yeni Kampanya";

  @observable
  String createOrPreviewMenuButtonText = "Önizleme";

  @observable
  ObservableList<String> tags = ObservableList.of([]);
  @observable
  ObservableList<MenuModel> restaurantMenu = ObservableList.of([]);
  @observable
  ObservableList<MenuModel> menusOnCampaigns = ObservableList.of([]);
  @observable
  ImageProvider? editMenuImage;

  final TextEditingController pickedMenu = TextEditingController();
  final TextEditingController discountAmount = TextEditingController();
  String? campaignFinishDate;
  bool isOnEditMode = false;

  @action
  fetchObservableWidgets(
      Widget createOrPreviewWidget, Widget initialCampaignWidget) {
    createOrPreviewMenuWidget = createOrPreviewWidget;
    campaignWidget = initialCampaignWidget;
  }

  @action
  _changePreviewOrAddMenuWidget(Widget currentWidget, bool isPreview) {
    createOrPreviewMenuButtonText = isPreview ? "Düzenle" : "Önizleme";
    createOrPreviewMenuWidget = currentWidget;
  }

  @action
  changeBetweenPreviewAndCreate(MenuViewModel viewModel) {
    if (createOrPreviewMenuButtonText == "Önizleme") {
      switch (_createMenuInputValidation) {
        case true:
          _changePreviewOrAddMenuWidget(
            PreviewCreatedMenu(viewModel: viewModel),
            true,
          );
          break;
        default:
          showErrorDialog(
              "Lütfen istenilen bilgilerin tamamının girildiğinden emin olun.");
      }
    } else {
      _changePreviewOrAddMenuWidget(
        CreateMenuInputs(viewModel: viewModel),
        false,
      );
    }
  }

  //TODO:Add compress.
  Future<void> pickImage() async {
    final XFile? image = await openFile(
      acceptedTypeGroups: <XTypeGroup>[
        const XTypeGroup(
          extensions: <String>['jpg', 'png', 'jpeg', 'heic'],
        ),
      ],
    );
    menuImage = await image?.readAsBytes();
    if (isOnEditMode) {
      _getEditingMenuImage("");
    }
  }

  bool get _createMenuInputValidation {
    if (menuContent.text != "" &&
        menuName.text != "" &&
        menuPrice.text != "" &&
        (menuImage != null || isOnEditMode) &&
        tags.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @action
  addTag() {
    if (tags.length >= 5) {
      showErrorDialog("En fazla beş etiket girebilirsiniz.");
      return;
    }

    if (tag.text.isNotEmpty) {
      tags.add(tag.text);
    }
    tag.text = "";
  }

  @action
  deleteTag(int index) {
    tags.removeAt(index);
  }

  Future<void> createMenu() async {
    if (_createMenuInputValidation) {
      final MenuModel? response =
          await service.createMenu(_fetchMenuModel, menuImage!, accessToken!);
      await _handleCreateMenuResponse(response);
    } else {
      showErrorDialog(
          "Lütfen istenilen bilgilerin tamamının girildiğinden emin olun.");
    }
  }

  Future<void> editMenu(MenuModel data) async {
    if (_createMenuInputValidation) {
      final MenuModel? response = await service.editMenu(
          _fetchEditedMenuModel(data), menuImage, accessToken!);
      await _handleEditMenuResponse(response);
    } else {
      showErrorDialog(
          "Lütfen istenilen bilgilerin tamamının girildiğinden emin olun.");
    }
  }

  @action
  _resetMenuInputs() {
    menuName.text = "";
    menuImage = null;
    menuPrice.text = "";
    menuContent.text = "";
    tags.clear();
  }

  Future<void> _handleCreateMenuResponse(MenuModel? response) async {
    if (response != null) {
      _resetMenuInputs();
      await addNewMenuToRestaurantMenu(response);
    } else {
      showErrorDialog();
    }
  }

  Future<void> _handleEditMenuResponse(MenuModel? response) async {
    if (response != null) {
      await changeMenuState(response);
      //Close dialog
      navigatorPop();
    } else {
      showErrorDialog();
    }
  }

  MenuModel _fetchEditedMenuModel(MenuModel data) {
    data.name = menuName.text;
    data.content = menuContent.text;
    data.price = int.parse(menuPrice.text);
    data.tags = tags.toList();
    return data;
  }

  MenuModel get _fetchMenuModel {
    return MenuModel(
      name: menuName.text,
      price: int.parse(menuPrice.text),
      photoUrl: "",
      content: menuContent.text,
      restaurantUid: localeManager.getStringData(LocaleKeysEnums.id.name),
      isOnDiscount: false,
      discountAmount: null,
      discountFinishDate: null,
      menuId: const Uuid().v7(),
      restaurantName: AppConst.restaurantName,
      tags: tags.toList(growable: false),
      stats: MenuStatsModel(
        comments: [],
        creationDate: DateTime.now().toIso8601String(),
        totalOrderCount: 0,
        likeRatio: 0,
        mostOrderTakingHour: "Henüz veri yok",
        totalRevenue: 0,
      ),
    );
  }

  Future<List<MenuModel>> fetchRestaurantMenu() async {
    restaurantMenu = ObservableList.of(await _getRestaurantMenuFromApi() ?? []);
    _separateCampaigns();
    return restaurantMenu;

    //TODO: Open it later when you want to display logic on cached menu
    // if (localeManager.getNullableJsonData(LocaleKeysEnums.menu.name) == null) {
    //   restaurantMenu =
    //       ObservableList.of(await _getRestaurantMenuFromApi() ?? []);
    // } else {
    //   restaurantMenu = ObservableList.of(_encodeMenuFromCache);
    // }
    // _separateCampaigns();
    // return restaurantMenu;
  }

  List<MenuModel> get _encodeMenuFromCache {
    final List<dynamic> cachedList =
        localeManager.getJsonData(LocaleKeysEnums.menu.name);
    final List<MenuModel> cachedListAsModel =
        cachedList.map((e) => MenuModel.fromJson(e)).toList();
    return cachedListAsModel;
  }

  Future<List<MenuModel>?> _getRestaurantMenuFromApi() async {
    final List<MenuModel>? response = await service.getRestaurantMenu(
        localeManager.getStringData(LocaleKeysEnums.id.name));
    if (response == null) {
      showErrorDialog("Menü getirilirken bir sorun oluştu.");
      return null;
    }
    await _cacheRestaurantMenu(response);

    return response;
  }

  Future<void> _cacheRestaurantMenu(List<MenuModel> data) async {
    await localeManager.setJsonData(
      LocaleKeysEnums.menu.name,
      data.map((e) => e.toJson()).toList(),
    );
  }

  @action
  Future<void> addNewMenuToRestaurantMenu(MenuModel data) async {
    restaurantMenu.add(data);
    await _cacheRestaurantMenu(restaurantMenu);
  }

  @action
  Future<void> changeMenuState(MenuModel data) async {
    final MenuModel oldElement =
        restaurantMenu.where((element) => element.menuId == data.menuId).first;
    restaurantMenu.remove(oldElement);
    restaurantMenu.add(data);
    await _cacheRestaurantMenu(restaurantMenu);
  }

  @action
  _separateCampaigns() {
    for (int i = 0; i <= restaurantMenu.length - 1; i++) {
      if (restaurantMenu[i].isOnDiscount) {
        menusOnCampaigns.add(restaurantMenu[i]);
      }
    }
  }

  @action
  cancelCampaign(String menuId) async {
    final bool? response = await service.cancelCampaign(menuId, accessToken!);
    if (response == null || response == false) {
      showErrorDialog();
    } else {
      final MenuModel element =
          menusOnCampaigns.where((element) => element.menuId == menuId).first;
      restaurantMenu
          .where((element) => element.menuId == menuId)
          .first
          .isOnDiscount = false;
      await _cacheRestaurantMenu(restaurantMenu);
      menusOnCampaigns.remove(element);
    }
  }

  @action
  changeCampaignScreen(MenuViewModel viewModel) {
    const String buttonTextActive = "Aktif Kampanyalar";
    const String buttonTextNext = "Yeni Kampanya";
    if (campaignButtonText == buttonTextNext) {
      campaignWidget = AddCampaign(viewModel: viewModel);
      campaignButtonText = buttonTextActive;
    } else {
      campaignWidget = ActiveCampaigns(viewModel: viewModel);
      campaignButtonText = buttonTextNext;
    }
  }

  List<DropdownMenuEntry> fetchAllMenuInDropdown() {
    List<DropdownMenuEntry> dataList = [];
    for (int i = 0; i <= restaurantMenu.length - 1; i++) {
      if (!restaurantMenu[i].isOnDiscount) {
        dataList.add(
          DropdownMenuEntry(
            value: restaurantMenu[i].name,
            label: restaurantMenu[i].name,
          ),
        );
      }
    }
    return dataList;
  }

  Future<void> openDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: viewModelContext,
      firstDate: DateTime.now(),
      lastDate: DateTime(2300),
      currentDate: DateTime.now(),
    );
    if (selectedDate != null) {
      campaignFinishDate = selectedDate.toIso8601String();
    }
  }

  Future<void> addCampaign() async {
    if (_campaignValidation) {
      final int amount = int.parse(discountAmount.text.substring(1));
      final AddCampaignModel? response = await service.addDiscount(
          AddCampaignModel(
            amount: amount,
            expireDate: campaignFinishDate!,
            menuId: _findMenuFromPickedMenu!.menuId,
          ),
          accessToken!);
      _handleAddCampaignResponse(response);
    } else {
      showErrorDialog("Lütfen sizden istenilen bilgileri giriniz.");
    }
  }

  @action
  _handleAddCampaignResponse(AddCampaignModel? response) {
    if (response == null) {
      showErrorDialog();
    } else {
      final MenuModel changedMenu = _findMenuFromPickedMenu!;

      changedMenu.discountFinishDate = response.expireDate;
      changedMenu.discountAmount = response.amount;
      changedMenu.isOnDiscount = true;
      menusOnCampaigns.add(changedMenu);
      campaignFinishDate = null;
      pickedMenu.text = "";
      discountAmount.text = "";
    }
  }

  MenuModel? get _findMenuFromPickedMenu {
    return restaurantMenu
        .where((element) => element.name == pickedMenu.text)
        .first;
  }

  bool get _campaignValidation {
    if (discountAmount.text != "" &&
        campaignFinishDate != null &&
        pickedMenu.text != "") {
      return true;
    } else {
      return false;
    }
  }

  navigateToMenuStats(MenuModel data, MenuViewModel viewModel) {
    navigationManager.navigate(MenuStats(
      data: data,
      viewModel: viewModel,
    ));
  }

  backToMenuView() {
    navigationManager.navigateAndRemoveUntil(const MainView());
  }

  @action
  Future<void> deleteMenu(MenuModel data) async {
    final bool? response = await service.deleteMenu(data, accessToken!);
    if (response != null && response) {
      restaurantMenu.remove(data);
      await _cacheRestaurantMenu(restaurantMenu);
    } else {
      showErrorDialog();
    }
  }

  initEditMenuDialog(MenuModel data) {
    isOnEditMode = true;
    _getEditingMenuImage(data.photoUrl);
    menuContent.text = data.content;
    menuPrice.text = data.price.toString();
    menuName.text = data.name;
    for (String element in data.tags) {
      tags.add(element);
    }
  }

  onEditDialogClose() {
    isOnEditMode = false;
    _resetMenuInputs();
  }

  @action
  _getEditingMenuImage(String url) {
    if (menuImage == null) {
      editMenuImage = NetworkImage(url);
    } else {
      editMenuImage = MemoryImage(menuImage!);
    }
  }
}
