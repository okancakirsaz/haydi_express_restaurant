// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adversiment_parent_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdvertisementParentViewModel
    on _AdvertisementParentViewModelBase, Store {
  late final _$pageIndexAtom = Atom(
      name: '_AdvertisementParentViewModelBase.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_AdvertisementParentViewModelBase.page', context: context);

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

  late final _$_AdvertisementParentViewModelBaseActionController =
      ActionController(
          name: '_AdvertisementParentViewModelBase', context: context);

  @override
  dynamic changePageIndex(int index) {
    final _$actionInfo = _$_AdvertisementParentViewModelBaseActionController
        .startAction(name: '_AdvertisementParentViewModelBase.changePageIndex');
    try {
      return super.changePageIndex(index);
    } finally {
      _$_AdvertisementParentViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
page: ${page}
    ''';
  }
}
