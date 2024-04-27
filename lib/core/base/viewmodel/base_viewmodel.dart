import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_manager.dart';
import 'package:haydi_express_restaurant/core/managers/navigation_manager.dart';

import '../../widgets/error_dialog.dart';

abstract mixin class BaseViewModel {
  late BuildContext viewModelContext;
  void setContext(BuildContext context);
  LocaleManager localeManager = LocaleManager.instance;
  NavigationManager get navigationManager =>
      NavigationManager(viewModelContext);
  void init() {}
  final ScrollController defaultScrollController = ScrollController();

  showErrorDialog([String? reason]) {
    ErrorDialog(
      context: viewModelContext,
      reason: reason,
    );
  }

  navigatorPop() {
    if (Navigator.canPop(viewModelContext)) {
      Navigator.pop(viewModelContext);
    }
  }
}
