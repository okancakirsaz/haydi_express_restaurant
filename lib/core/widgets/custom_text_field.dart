// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/radius_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';

class CustomTextField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextEditingController controller;
  final TextStyle? style;
  final String hint;
  final TextStyle? hintStyle;
  final TextInputType? inputType;
  final bool? isReadOnly;

  const CustomTextField(
      {super.key,
      this.padding,
      required this.controller,
      this.style,
      this.inputType,
      this.isReadOnly,
      required this.hint,
      this.hintStyle});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.hint,
            style: widget.hintStyle ?? TextConsts.instance.regularWhite25,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
              boxShadow: ColorConsts.instance.shadow,
              color: _isFocused
                  ? ColorConsts.instance.background
                  : ColorConsts.instance.blurGrey,
              borderRadius: RadiusConsts.instance.circularAll10,
            ),
            child: TextFormField(
              onChanged: (_) {
                _isFocused = true;
                setState(() {});
              },
              textInputAction: TextInputAction.next,
              readOnly: widget.isReadOnly ?? false,
              keyboardType: widget.inputType,
              inputFormatters: widget.inputType == TextInputType.phone ||
                      widget.inputType == TextInputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              cursorColor: Colors.black,
              style: widget.style ?? TextConsts.instance.regularBlack20,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5, left: 10),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}
