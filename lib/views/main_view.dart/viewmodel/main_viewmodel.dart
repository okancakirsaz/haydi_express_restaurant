import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/views/menu_view/view/menu_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'main_viewmodel.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    //TODO: Get data from cache
    restaurantName = "Restaurant Name";
  }

  @observable
  Widget page = const MenuView();

  late final String restaurantName;

  @action
  changePage(Widget newPage) {
    page = newPage;
  }
}
