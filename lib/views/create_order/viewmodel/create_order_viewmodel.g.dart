// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateOrderViewModel on _CreateOrderViewModelBase, Store {
  late final _$cityDropdownItemsAtom = Atom(
      name: '_CreateOrderViewModelBase.cityDropdownItems', context: context);

  @override
  ObservableList<DropdownMenuEntry<dynamic>> get cityDropdownItems {
    _$cityDropdownItemsAtom.reportRead();
    return super.cityDropdownItems;
  }

  @override
  set cityDropdownItems(ObservableList<DropdownMenuEntry<dynamic>> value) {
    _$cityDropdownItemsAtom.reportWrite(value, super.cityDropdownItems, () {
      super.cityDropdownItems = value;
    });
  }

  late final _$stateDropdownItemsAtom = Atom(
      name: '_CreateOrderViewModelBase.stateDropdownItems', context: context);

  @override
  ObservableList<DropdownMenuEntry<dynamic>> get stateDropdownItems {
    _$stateDropdownItemsAtom.reportRead();
    return super.stateDropdownItems;
  }

  @override
  set stateDropdownItems(ObservableList<DropdownMenuEntry<dynamic>> value) {
    _$stateDropdownItemsAtom.reportWrite(value, super.stateDropdownItems, () {
      super.stateDropdownItems = value;
    });
  }

  late final _$menuAtom =
      Atom(name: '_CreateOrderViewModelBase.menu', context: context);

  @override
  ObservableList<MenuModel> get menu {
    _$menuAtom.reportRead();
    return super.menu;
  }

  @override
  set menu(ObservableList<MenuModel> value) {
    _$menuAtom.reportWrite(value, super.menu, () {
      super.menu = value;
    });
  }

  late final _$selectedItemsAtom =
      Atom(name: '_CreateOrderViewModelBase.selectedItems', context: context);

  @override
  ObservableList<BucketElementModel> get selectedItems {
    _$selectedItemsAtom.reportRead();
    return super.selectedItems;
  }

  @override
  set selectedItems(ObservableList<BucketElementModel> value) {
    _$selectedItemsAtom.reportWrite(value, super.selectedItems, () {
      super.selectedItems = value;
    });
  }

  late final _$selectedMenuItemCountAtom = Atom(
      name: '_CreateOrderViewModelBase.selectedMenuItemCount',
      context: context);

  @override
  int get selectedMenuItemCount {
    _$selectedMenuItemCountAtom.reportRead();
    return super.selectedMenuItemCount;
  }

  @override
  set selectedMenuItemCount(int value) {
    _$selectedMenuItemCountAtom.reportWrite(value, super.selectedMenuItemCount,
        () {
      super.selectedMenuItemCount = value;
    });
  }

  late final _$getRestaurantMenuAsyncAction = AsyncAction(
      '_CreateOrderViewModelBase.getRestaurantMenu',
      context: context);

  @override
  Future<List<MenuModel>> getRestaurantMenu() {
    return _$getRestaurantMenuAsyncAction.run(() => super.getRestaurantMenu());
  }

  late final _$_CreateOrderViewModelBaseActionController =
      ActionController(name: '_CreateOrderViewModelBase', context: context);

  @override
  dynamic fetchCityAsDropdownMenuItem() {
    final _$actionInfo =
        _$_CreateOrderViewModelBaseActionController.startAction(
            name: '_CreateOrderViewModelBase.fetchCityAsDropdownMenuItem');
    try {
      return super.fetchCityAsDropdownMenuItem();
    } finally {
      _$_CreateOrderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchStatesAsDropdownMenuItem() {
    final _$actionInfo =
        _$_CreateOrderViewModelBaseActionController.startAction(
            name: '_CreateOrderViewModelBase.fetchStatesAsDropdownMenuItem');
    try {
      return super.fetchStatesAsDropdownMenuItem();
    } finally {
      _$_CreateOrderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterMenu(String query) {
    final _$actionInfo = _$_CreateOrderViewModelBaseActionController
        .startAction(name: '_CreateOrderViewModelBase.filterMenu');
    try {
      return super.filterMenu(query);
    } finally {
      _$_CreateOrderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCount(bool isIncrement) {
    final _$actionInfo = _$_CreateOrderViewModelBaseActionController
        .startAction(name: '_CreateOrderViewModelBase.changeCount');
    try {
      return super.changeCount(isIncrement);
    } finally {
      _$_CreateOrderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addSelectedItems(MenuModel data) {
    final _$actionInfo = _$_CreateOrderViewModelBaseActionController
        .startAction(name: '_CreateOrderViewModelBase.addSelectedItems');
    try {
      return super.addSelectedItems(data);
    } finally {
      _$_CreateOrderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteSelectedItem(int index) {
    final _$actionInfo = _$_CreateOrderViewModelBaseActionController
        .startAction(name: '_CreateOrderViewModelBase.deleteSelectedItem');
    try {
      return super.deleteSelectedItem(index);
    } finally {
      _$_CreateOrderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cityDropdownItems: ${cityDropdownItems},
stateDropdownItems: ${stateDropdownItems},
menu: ${menu},
selectedItems: ${selectedItems},
selectedMenuItemCount: ${selectedMenuItemCount}
    ''';
  }
}
