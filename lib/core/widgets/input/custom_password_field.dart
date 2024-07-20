import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';

class CustomPasswordField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextEditingController controller;
  final TextStyle? style;
  final String hint;
  final TextStyle? hintStyle;
  final TextInputType? inputType;

  const CustomPasswordField(
      {super.key,
      this.padding,
      required this.controller,
      this.style,
      this.inputType,
      required this.hint,
      this.hintStyle});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.hint,
            style: widget.hintStyle ?? TextConsts.instance.regularWhite16,
          ),
          const SizedBox(
            height: 5,
          ),
          PasswordField(
            onChanged: (_) {
              isFocused = true;
              setState(() {});
            },
            backgroundColor: isFocused
                ? ColorConsts.instance.background
                : ColorConsts.instance.blurGrey,
            hintText: null,
            errorMaxLines: 1,
            floatingText: null,
            border: PasswordBorder(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            errorMessage: "",
            passwordDecoration: PasswordDecoration(
              inputStyle: widget.style ?? TextConsts.instance.regularBlack16,
              inputPadding: const EdgeInsets.all(10),
            ),
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
