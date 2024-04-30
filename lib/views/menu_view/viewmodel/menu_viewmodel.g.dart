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

  late final _$_MenuViewModelBaseActionController =
      ActionController(name: '_MenuViewModelBase', context: context);

  @override
  dynamic fetchCreateOrPreviewMenuWidget(Widget currentWidget, bool isPreview) {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.fetchCreateOrPreviewMenuWidget');
    try {
      return super.fetchCreateOrPreviewMenuWidget(currentWidget, isPreview);
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
  String toString() {
    return '''
createOrPreviewMenuWidget: ${createOrPreviewMenuWidget},
createOrPreviewMenuButtonText: ${createOrPreviewMenuButtonText}
    ''';
  }
}
