import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/menu_view/models/menu_model.dart';
import 'package:haydi_express_restaurant/views/menu_view/service/menu_service.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';
import '../view/menu_view.dart';

part 'menu_viewmodel.g.dart';

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
  Uint8List? menuImage;

  @observable
  Widget createOrPreviewMenuWidget = const SizedBox();

  @observable
  String createOrPreviewMenuButtonText = "Önizleme";

  @observable
  ObservableList<MenuModel> restaurantMenu = ObservableList.of([]);

  @action
  fetchCreateOrPreviewMenuWidget(Widget currentWidget, bool isPreview) {
    createOrPreviewMenuButtonText = isPreview ? "Düzenle" : "Önizleme";
    createOrPreviewMenuWidget = currentWidget;
  }

  @action
  changeBetweenPreviewAndCreate(MenuViewModel viewModel) {
    if (createOrPreviewMenuButtonText == "Önizleme") {
      switch (_createMenuInputValidation) {
        case true:
          viewModel.fetchCreateOrPreviewMenuWidget(
              PreviewCreatedMenu(viewModel: viewModel), true);
          break;
        default:
          showErrorDialog(
              "Lütfen istenilen bilgilerin tamamının girildiğinden emin olun.");
      }
    } else {
      viewModel.fetchCreateOrPreviewMenuWidget(
          CreateMenuInputs(viewModel: viewModel), false);
    }
  }

  //TODO: *REVIEW* Add compress.
  Future<void> pickImage() async {
    final XFile? image = await openFile(
      acceptedTypeGroups: <XTypeGroup>[
        const XTypeGroup(
          extensions: <String>['jpg', 'png', 'jpeg', 'heic'],
        ),
      ],
    );
    menuImage = await image?.readAsBytes();
  }

  bool get _createMenuInputValidation {
    if (menuContent.text != "" &&
        menuName.text != "" &&
        menuPrice.text != "" &&
        menuImage != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createMenu() async {
    if (_createMenuInputValidation) {
      final MenuModel? response =
          await service.createMenu(_fetchMenuModel, menuImage!);
      _handleCreateMenuResponse(response);
    } else {
      showErrorDialog(
          "Lütfen istenilen bilgilerin tamamının girildiğinden emin olun.");
    }
  }

  _handleCreateMenuResponse(MenuModel? response) {
    if (response != null) {
      menuName.text = "";
      menuImage = null;
      menuPrice.text = "";
      menuContent.text = "";
      addNewMenuToRestaurantMenu(response);
    } else {
      showErrorDialog();
    }
  }

  MenuModel get _fetchMenuModel {
    return MenuModel(
      name: menuName.text,
      price: int.parse(menuPrice.text),
      photoUrl: "",
      content: menuContent.text,
      restaurantUid: localeManager.getStringData(LocaleKeysEnums.id.name),
      isOnDiscount: null,
      discountAmount: null,
      discountFinishDate: null,
      menuId: const Uuid().v7(),
      stats: {},
    );
  }

  Future<List<MenuModel>?> getRestaurantMenu() async {
    final List<MenuModel>? response = await service.getRestaurantMenu(
        localeManager.getStringData(LocaleKeysEnums.id.name));
    if (response == null) {
      showErrorDialog("Menü getirilirken bir sorun oluştu.");
    } else {
      restaurantMenu = ObservableList.of(response);
    }
    return response;
  }

  @action
  addNewMenuToRestaurantMenu(MenuModel data) {
    restaurantMenu.add(data);
  }
}
