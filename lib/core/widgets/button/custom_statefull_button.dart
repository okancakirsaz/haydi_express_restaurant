import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';

class CustomStateFullButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TextStyle? style;
  final String text;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  const CustomStateFullButton(
      {super.key,
      required this.onPressed,
      this.style,
      required this.text,
      this.width,
      this.height,
      this.borderRadius,
      this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: height ?? 40,
      constraints: const BoxConstraints(
        minHeight: 40,
        minWidth: 130,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorConsts.instance.primary,
        border: const Border(),
        borderRadius: borderRadius ?? RadiusConsts.instance.circularAll10,
        boxShadow: ColorConsts.instance.shadow,
      ),
      child: EasyButton(
          type: EasyButtonType.text,
          buttonColor: backgroundColor ?? ColorConsts.instance.primary,
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
