import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/widgets/error_dialog.dart';
import 'package:haydi_ekspres_dev_tools/widgets/success_dialog.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_manager.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_sql_manager.dart';
import 'package:haydi_express_restaurant/core/managers/navigation_manager.dart';
import 'package:intl/intl.dart';

abstract mixin class BaseViewModel {
  late BuildContext viewModelContext;
  void setContext(BuildContext context);
  LocaleManager localeManager = LocaleManager.instance;
  LocaleSqlManager localeSqlManager = LocaleSqlManager.instance;
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

  showSuccessDialog([String? reason]) {
    SuccessDialog(context: viewModelContext, reason: reason);
  }

  navigatorPop() {
    if (Navigator.canPop(viewModelContext)) {
      Navigator.pop(viewModelContext);
    }
  }

  String parseIso8601DateFormat(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);

    return DateFormat('dd.MM.yyyy').format(dateTime);
  }

  int calculateDiscount(int price, int discountAmount) {
    return (price - ((price * discountAmount) / 100)).toInt();
  }

  String? get accessToken =>
      localeManager.getNullableStringData(LocaleKeysEnums.accessToken.name);
}
