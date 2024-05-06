import 'package:flutter/material.dart';

import '../consts/text_consts.dart';

class PartTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const PartTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ListTile(
        leading: Text(
          title,
          style: TextConsts.instance.regularBlack20Bold,
        ),
        title: Text(
          subtitle != null ? "- $subtitle" : "",
          style: TextConsts.instance.regularBlack16,
        ),
      ),
    );
  }
}
