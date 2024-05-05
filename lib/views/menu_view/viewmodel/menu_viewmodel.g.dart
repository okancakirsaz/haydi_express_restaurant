// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuViewModel on _MenuViewModelBase, Store {
  late final _$createOrPreviewMenuWidgetAtom = Atom(
      name: '_MenuViewModelBase.createOrPreviewMenuWidget', context: context);

  @override
  Widget get createOrPreviewMenuWidget {
    _$createOrPreviewMenuWidgetAtom.reportRead();
    return super.createOrPreviewMenuWidget;
  }

  @override
  set createOrPreviewMenuWidget(Widget value) {
    _$createOrPreviewMenuWidgetAtom
        .reportWrite(value, super.createOrPreviewMenuWidget, () {
      super.createOrPreviewMenuWidget = value;
    });
  }

  late final _$campaignWidgetAtom =
      Atom(name: '_MenuViewModelBase.campaignWidget', context: context);

  @override
  Widget get campaignWidget {
    _$campaignWidgetAtom.reportRead();
    return super.campaignWidget;
  }

  @override
  set campaignWidget(Widget value) {
    _$campaignWidgetAtom.reportWrite(value, super.campaignWidget, () {
      super.campaignWidget = value;
    });
  }

  late final _$campaignButtonTextAtom =
      Atom(name: '_MenuViewModelBase.campaignButtonText', context: context);

  @override
  String get campaignButtonText {
    _$campaignButtonTextAtom.reportRead();
    return super.campaignButtonText;
  }

  @override
  set campaignButtonText(String value) {
    _$campaignButtonTextAtom.reportWrite(value, super.campaignButtonText, () {
      super.campaignButtonText = value;
    });
  }

  late final _$createOrPreviewMenuButtonTextAtom = Atom(
      name: '_MenuViewModelBase.createOrPreviewMenuButtonText',
      context: context);

  @override
  String get createOrPreviewMenuButtonText {
    _$createOrPreviewMenuButtonTextAtom.reportRead();
    return super.createOrPreviewMenuButtonText;
  }

  @override
  set createOrPreviewMenuButtonText(String value) {
    _$createOrPreviewMenuButtonTextAtom
        .reportWrite(value, super.createOrPreviewMenuButtonText, () {
      super.createOrPreviewMenuButtonText = value;
    });
  }

  late final _$restaurantMenuAtom =
      Atom(name: '_MenuViewModelBase.restaurantMenu', context: context);

  @override
  ObservableList<MenuModel> get restaurantMenu {
    _$restaurantMenuAtom.reportRead();
    return super.restaurantMenu;
  }

  @override
  set restaurantMenu(ObservableList<MenuModel> value) {
    _$restaurantMenuAtom.reportWrite(value, super.restaurantMenu, () {
      super.restaurantMenu = value;
    });
  }

  late final _$menusOnCampaignsAtom =
      Atom(name: '_MenuViewModelBase.menusOnCampaigns', context: context);

  @override
  ObservableList<MenuModel> get menusOnCampaigns {
    _$menusOnCampaignsAtom.reportRead();
    return super.menusOnCampaigns;
  }

  @override
  set menusOnCampaigns(ObservableList<MenuModel> value) {
    _$menusOnCampaignsAtom.reportWrite(value, super.menusOnCampaigns, () {
      super.menusOnCampaigns = value;
    });
  }

  late final _$cancelCampaignAsyncAction =
      AsyncAction('_MenuViewModelBase.cancelCampaign', context: context);

  @override
  Future cancelCampaign(String menuId) {
    return _$cancelCampaignAsyncAction.run(() => super.cancelCampaign(menuId));
  }

  late final _$deleteMenuAsyncAction =
      AsyncAction('_MenuViewModelBase.deleteMenu', context: context);

  @override
  Future<void> deleteMenu(MenuModel data) {
    return _$deleteMenuAsyncAction.run(() => super.deleteMenu(data));
  }

  late final _$_MenuViewModelBaseActionController =
      ActionController(name: '_MenuViewModelBase', context: context);

  @override
  dynamic fetchObservableWidgets(
      Widget createOrPreviewWidget, Widget initialCampaignWidget) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.fetchObservableWidgets');
    try {
      return super
          .fetchObservableWidgets(createOrPreviewWidget, initialCampaignWidget);
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _changePreviewOrAddMenuWidget(Widget currentWidget, bool isPreview) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase._changePreviewOrAddMenuWidget');
    try {
      return super._changePreviewOrAddMenuWidget(currentWidget, isPreview);
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBetweenPreviewAndCreate(MenuViewModel viewModel) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.changeBetweenPreviewAndCreate');
    try {
      return super.changeBetweenPreviewAndCreate(viewModel);
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addNewMenuToRestaurantMenu(MenuModel data) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.addNewMenuToRestaurantMenu');
    try {
      return super.addNewMenuToRestaurantMenu(data);
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _separateCampaigns() {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase._separateCampaigns');
    try {
      return super._separateCampaigns();
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCampaignScreen(MenuViewModel viewModel) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.changeCampaignScreen');
    try {
      return super.changeCampaignScreen(viewModel);
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _handleAddCampaignResponse(AddCampaignModel? response) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase._handleAddCampaignResponse');
    try {
      return super._handleAddCampaignResponse(response);
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
createOrPreviewMenuWidget: ${createOrPreviewMenuWidget},
campaignWidget: ${campaignWidget},
campaignButtonText: ${campaignButtonText},
createOrPreviewMenuButtonText: ${createOrPreviewMenuButtonText},
restaurantMenu: ${restaurantMenu},
menusOnCampaigns: ${menusOnCampaigns}
    ''';
  }
}
