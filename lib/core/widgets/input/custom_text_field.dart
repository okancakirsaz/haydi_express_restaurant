// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';

class CustomTextField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextEditingController controller;
  final TextStyle? style;
  final String hint;
  final String? label;
  final TextStyle? hintStyle;
  final bool? isReadOnly;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? customInputFormatters;

  const CustomTextField({
    super.key,
    this.padding,
    required this.controller,
    this.style,
    this.isReadOnly,
    required this.hint,
    this.hintStyle,
    this.customInputFormatters,
    this.maxLength,
    this.label,
    this.keyboardType,
  });

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
            style: widget.hintStyle ?? TextConsts.instance.regularWhite16,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
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
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              textInputAction: TextInputAction.next,
              readOnly: widget.isReadOnly ?? false,
              inputFormatters: widget.customInputFormatters,
              cursorColor: Colors.black,
              style: widget.style ?? TextConsts.instance.regularBlack16,
              decoration: InputDecoration(
                hintText: widget.label,
                hintStyle: TextConsts.instance.regularThird12,
                counter: const SizedBox(),
                contentPadding: const EdgeInsets.only(bottom: 5, left: 10),
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
