import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/views/authentication/forgot_password/view/forgot_password_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'log_in_viewmodel.g.dart';

class LogInViewModel = _LogInViewModelBase with _$LogInViewModel;

abstract class _LogInViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  navigateToForgotPassword() {
    navigationManager.navigate(const ForgotPasswordView());
  }
}