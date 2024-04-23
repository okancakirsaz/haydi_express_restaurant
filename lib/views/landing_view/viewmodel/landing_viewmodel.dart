import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/core/init/web_socket_manager.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'landing_viewmodel.g.dart';

class LandingViewModel = _LandingViewModelBase with _$LandingViewModel;

abstract class _LandingViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<String?> init() async {
    WebSocketManager.instance.initializeSocketConnection();
    await localeManager.getSharedPreferencesInstance();
    return _checkIsUserLoggedIn();
  }

  String _checkIsUserLoggedIn() {
    return localeManager.getNullableStringData(LocaleKeysEnums.id.name) ??
        "Auth";
  }
}
