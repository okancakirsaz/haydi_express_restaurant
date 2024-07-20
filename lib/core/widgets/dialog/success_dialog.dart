import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';

class SuccessDialog {
  final String? reason;
  final BuildContext context;
  SuccessDialog({required this.context, this.reason}) {
    show();
  }
  show() {
    toastification.show(
      primaryColor: ColorConsts.instance.primary,
      context: context,
      type: ToastificationType.success,
      title: Text(
        reason ?? "İşlem Başarılı",
        style: TextConsts.instance.regularBlack16,
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
