import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/radius_consts.dart';

import '../consts/text_consts.dart';

class CustomStateFullButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TextStyle? style;
  final String text;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  const CustomStateFullButton(
      {super.key,
      required this.onPressed,
      this.style,
      required this.text,
      this.width,
      this.height,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: height ?? 50,
      constraints: const BoxConstraints(
        minHeight: 40,
        minWidth: 130,
      ),
      decoration: BoxDecoration(
        color: ColorConsts.instance.primary,
        border: const Border(),
        borderRadius: borderRadius ?? RadiusConsts.instance.circularAll20,
        boxShadow: ColorConsts.instance.shadow,
      ),
      child: EasyButton(
          type: EasyButtonType.text,
          buttonColor: ColorConsts.instance.primary,
          borderRadius: 20,
          onPressed: onPressed,
          idleStateWidget: Text(
            text,
            style: style ?? TextConsts.instance.regularWhite20,
            textAlign: TextAlign.center,
          ),
          loadingStateWidget: Padding(
            padding: PaddingConsts.instance.all10,
            child: CircularProgressIndicator(
              color: ColorConsts.instance.lightThird,
            ),
          )),
    );
  }
}
