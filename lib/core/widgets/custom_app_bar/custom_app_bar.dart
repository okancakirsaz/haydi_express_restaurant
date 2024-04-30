import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_app_bar/app_bar_elements.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_app_bar/viewmodel/custom_app_bar_viewmodel.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_text_button.dart';
import 'package:haydi_express_restaurant/views/main_view.dart/viewmodel/main_viewmodel.dart';
import 'package:haydi_express_restaurant/views/menu_view/view/menu_view.dart';

import '../../consts/color_consts/color_consts.dart';

class CustomAppBar {
  final BuildContext context;
  final String title;
  final MainViewModel mainViewModel;
  final List<String> elements = AppBarElements.instance.elements;
  final CustomAppBarViewModel model = CustomAppBarViewModel();

  CustomAppBar(
    this.context, {
    required this.title,
    required this.mainViewModel,
  }) {
    model.init();
    model.setContext(context);
    model.setMainViewModel(mainViewModel);
  }

  PreferredSizeWidget build() {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: ColorConsts.instance.third,
      title: Text(
        title,
        style: TextConsts.instance.regularWhite20Bold,
      ),
      centerTitle: false,
      actions: <Widget>[
        buildTextButton(const MenuView(), 0, elements[0]),
        buildTextButton(const Center(child: Text("1")), 1, elements[1]),
        buildTextButton(const Center(child: Text("2")), 2, elements[2]),
        buildTextButton(const Center(child: Text("3")), 3, elements[3]),
        buildTextButton(const Center(child: Text("4")), 4, elements[4]),
        buildTextButton(const Center(child: Text("5")), 5, elements[5]),
      ],
    );
  }

  Widget buildTextButton(Widget page, int index, String text) {
    return Observer(builder: (context) {
      return CustomTextButton(
        onPressed: () => model.changePage(page, index),
        style: index == model.pageIndex
            ? TextConsts.instance.regularPrimary16
            : TextConsts.instance.regularWhite16,
        text: text,
      );
    });
  }
}
