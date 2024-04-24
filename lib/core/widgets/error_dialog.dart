import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';

import '../consts/color_consts/color_consts.dart';

class ErrorDialog extends StatelessWidget {
  final String? reason;
  const ErrorDialog({super.key, this.reason});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConsts.instance.third,
      content: Center(
        child: Text(
          reason ?? "Bir sorun oluştu, tekrar deneyiniz.",
          style: TextConsts.instance.regularWhite16Bold,
        ),
      ),
    );
  }
}
