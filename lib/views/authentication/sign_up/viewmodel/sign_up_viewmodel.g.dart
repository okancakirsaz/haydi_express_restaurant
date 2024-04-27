// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  late final _$titleAtom =
      Atom(name: '_SignUpViewModelBase.title', context: context);

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

  late final _$pageAtom =
      Atom(name: '_SignUpViewModelBase.page', context: context);

  @override
  Widget get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(Widget value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$processAtom =
      Atom(name: '_SignUpViewModelBase.process', context: context);

  @override
  double get process {
    _$processAtom.reportRead();
    return super.process;
  }

  @override
  set process(double value) {
    _$processAtom.reportWrite(value, super.process, () {
      super.process = value;
    });
  }

  late final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase', context: context);

  @override
  dynamic setInitialPage(SignUpViewModel viewModel) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.setInitialPage');
    try {
      return super.setInitialPage(viewModel);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goToPage(Widget nextPage, String newTitle, int index, bool isNext) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.goToPage');
    try {
      return super.goToPage(nextPage, newTitle, index, isNext);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProcessBarStatus(int index, bool isNext) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.changeProcessBarStatus');
    try {
      return super.changeProcessBarStatus(index, isNext);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
page: ${page},
process: ${process}
    ''';
  }
}
