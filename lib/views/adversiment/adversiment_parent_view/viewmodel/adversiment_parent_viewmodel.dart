import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/views/adversiment/active_ads_view/view/active_ads_view.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/view/get_ads_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'adversiment_parent_viewmodel.g.dart';

class AdvertisementParentViewModel = _AdvertisementParentViewModelBase
    with _$AdvertisementParentViewModel;

abstract class _AdvertisementParentViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  @observable
  int pageIndex = 0;

  List<Widget> pages = [
    const GetAdsView(),
    const ActiveAdsView(),
  ];

  @observable
  Widget page = const GetAdsView();

  @action
  changePageIndex(int index) {
    pageIndex = index;
    page = pages[index];
  }
}
