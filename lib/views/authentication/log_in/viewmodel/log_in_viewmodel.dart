import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/authentication/forgot_password/view/forgot_password_view.dart';
import 'package:haydi_express_restaurant/views/authentication/log_in/service/log_in_service.dart';
import 'package:haydi_express_restaurant/views/authentication/models/log_in_model.dart';
import 'package:haydi_express_restaurant/views/authentication/sign_up/view/sign_up_view.dart';
import 'package:haydi_express_restaurant/views/main_view.dart/view/main_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'log_in_viewmodel.g.dart';

class LogInViewModel = _LogInViewModelBase with _$LogInViewModel;

abstract class _LogInViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final LogInService service = LogInService();

  navigateToForgotPassword() {
    navigationManager.navigate(const ForgotPasswordView());
  }

  navigateToSignUp() {
    navigationManager.navigate(const SignUpView());
  }

  _navigateToMainPage() {
    navigationManager.navigateAndRemoveUntil(const MainView());
  }

  Future<void> tryToLogIn(String mail, String pass) async {
    if (mail.isEmpty || pass.isEmpty || !mail.contains("@")) {
      showErrorDialog("E-Posta veya şifre eksik.");
      return;
    }

    final LogInModel? response = await _sendLogInRequest(mail, pass);

    if (response == null) {
      showErrorDialog();
      return;
    }

    if (!response.isLoginSuccess) {
      showErrorDialog(response.unSuccessfulReason);
      return;
    }
    await localeManager.setStringData(LocaleKeysEnums.id.name, response.uid!);
    await localeManager.setJsonData(
      LocaleKeysEnums.restaurantData.name,
      response.restaurantData!.toJson(),
    );
    _navigateToMainPage();
  }

  Future<LogInModel?> _sendLogInRequest(String mail, String pass) async {
    final LogInModel? response = await service.logIn(LogInModel(
      mail: mail,
      password: pass,
      isLoginSuccess: false,
    ));
    return response;
  }
}
