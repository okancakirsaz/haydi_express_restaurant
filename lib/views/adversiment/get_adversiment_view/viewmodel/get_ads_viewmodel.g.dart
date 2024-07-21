// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ads_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAdsViewModel on _GetAdsViewModelBase, Store {
  late final _$contentAtom =
      Atom(name: '_GetAdsViewModelBase.content', context: context);

  @override
  Widget? get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(Widget? value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$infoAtom =
      Atom(name: '_GetAdsViewModelBase.info', context: context);

  @override
  Widget? get info {
    _$infoAtom.reportRead();
    return super.info;
  }

  @override
  set info(Widget? value) {
    _$infoAtom.reportWrite(value, super.info, () {
      super.info = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_GetAdsViewModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$buttonTextAtom =
      Atom(name: '_GetAdsViewModelBase.buttonText', context: context);

  @override
  String get buttonText {
    _$buttonTextAtom.reportRead();
    return super.buttonText;
  }

  @override
  set buttonText(String value) {
    _$buttonTextAtom.reportWrite(value, super.buttonText, () {
      super.buttonText = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_GetAdsViewModelBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$_GetAdsViewModelBaseActionController =
      ActionController(name: '_GetAdsViewModelBase', context: context);

  @override
  dynamic changeContent() {
    final _$actionInfo = _$_GetAdsViewModelBaseActionController.startAction(
        name: '_GetAdsViewModelBase.changeContent');
    try {
      return super.changeContent();
    } finally {
      _$_GetAdsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getBoostAreaInfo() {
    final _$actionInfo = _$_GetAdsViewModelBaseActionController.startAction(
        name: '_GetAdsViewModelBase._getBoostAreaInfo');
    try {
      return super._getBoostAreaInfo();
    } finally {
      _$_GetAdsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
content: ${content},
info: ${info},
title: ${title},
buttonText: ${buttonText},
description: ${description}
    ''';
  }
}
