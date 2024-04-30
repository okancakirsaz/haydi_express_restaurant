import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';
import '../view/menu_view.dart';

part 'menu_viewmodel.g.dart';

class MenuViewModel = _MenuViewModelBase with _$MenuViewModel;

abstract class _MenuViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  final TextEditingController menuName = TextEditingController();
  final TextEditingController menuPrice = TextEditingController();
  final TextEditingController menuContent = TextEditingController();
  Uint8List? menuImage;

  @observable
  Widget createOrPreviewMenuWidget = const SizedBox();

  @observable
  String createOrPreviewMenuButtonText = "Önizleme";

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
}
