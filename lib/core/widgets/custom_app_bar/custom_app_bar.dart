import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_app_bar/app_bar_elements.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_app_bar/viewmodel/custom_app_bar_viewmodel.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_text_button.dart';
import 'package:haydi_express_restaurant/views/chat/view/chat_view.dart';
import 'package:haydi_express_restaurant/views/main_view/viewmodel/main_viewmodel.dart';
import 'package:haydi_express_restaurant/views/menu_view/view/menu_view.dart';
import 'package:haydi_express_restaurant/views/orders/view/orders_view.dart';
import 'package:haydi_express_restaurant/views/profile/profile_view/view/profile_view.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';

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
        buildTextButton(const OrdersView(), 1, elements[1]),
        buildTextButton(const ProfileView(), 2, elements[2]),
        buildTextButton(const Center(child: Text("3")), 3, elements[3]),
        buildTextButton(
            const Center(
              child: ChatView(
                isContactingWithCustomer: false,
                targetId: "live-support",
                targetName: "Canlı Destek",
              ),
            ),
            5,
            elements[5]),
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
