import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/views/authentication/sign_up/view/sign_up_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  List<String> titles = [
    "Restoran Sahibinin Bilgilerini Giriniz",
    "Restoran Bilgilerini Giriniz"
  ];

  @observable
  String title = "Restoran Sahibinin Bilgilerini Giriniz";

  @observable
  Widget page = Container();

  @observable
  double process = 50;

  final TextEditingController ownerName = TextEditingController();
  final TextEditingController ownerSurName = TextEditingController();
  final TextEditingController ownerPhoneNumber = TextEditingController();
  final TextEditingController restaurantName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController taxNumber = TextEditingController();

  @action
  setInitialPage(SignUpViewModel viewModel) {
    page = RestaurantOwnerInputs(viewModel: viewModel);
  }

  @action
  goNextPage(Widget nextPage, String newTitle) {
    title = newTitle;
    page = nextPage;
  }
}
