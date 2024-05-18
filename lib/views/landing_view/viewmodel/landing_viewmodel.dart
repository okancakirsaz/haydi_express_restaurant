import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/core/managers/web_socket_manager.dart';
import 'package:haydi_express_restaurant/views/landing_view/view/components/splash_screen.dart';
import 'package:haydi_express_restaurant/views/main_view.dart/view/main_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

import '../../authentication/log_in/view/log_in_view.dart';

part 'landing_viewmodel.g.dart';

class LandingViewModel = _LandingViewModelBase with _$LandingViewModel;

abstract class _LandingViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<Widget?> init() async {
    WebSocketManager.instance.initializeSocketConnection();
    await localeManager.getSharedPreferencesInstance();
    await localeSqlManager.initDb();
    await localeManager.removeData(LocaleKeysEnums.menu.name);
    _checkLoggedInState();
    return defaultWidget;
  }

  Widget defaultWidget = const SplashScreen();

  _checkLoggedInState() {
    String? userId =
        localeManager.getNullableStringData(LocaleKeysEnums.id.name);
    if (userId == null) {
      //Auth Screen
      defaultWidget = const LogInView();
    } else {
      //Main Screen
      defaultWidget = const MainView();
    }
  }
}
