import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haydi_express_restaurant/core/base/view/base_view.dart';
import 'package:haydi_express_restaurant/core/consts/asset_consts.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'custom_bottom_nav_bar_viewmodel.dart';

class CustomButtonNavBar extends StatelessWidget {
  static final CustomBottomNavBarViewModel viewModel =
      CustomBottomNavBarViewModel();
  const CustomButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CustomBottomNavBarViewModel>(
        viewModel: viewModel,
        onPageBuilder: (context, model) {
          return Observer(builder: (context) {
            return BottomNavigationBar(
                onTap: (index) => model.changePage(index),
                currentIndex: model.currentIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                unselectedLabelStyle: TextConsts.instance.regularWhite14,
                selectedLabelStyle: TextConsts.instance.regularWhite16Bold,
                backgroundColor: ColorConsts.instance.green,
                elevation: 4,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "Siparişler",
                    icon: buildIcon(AssetConsts.instance.beer),
                  ),
                  BottomNavigationBarItem(
                      label: "Menü",
                      icon: buildIcon(AssetConsts.instance.menu)),
                  BottomNavigationBarItem(
                      label: "Kullanıcılar",
                      icon: buildIcon(AssetConsts.instance.profile)),
                  BottomNavigationBarItem(
                      label: "Etkinlikler",
                      icon: buildIcon(AssetConsts.instance.events)),
                ]);
          });
        },
        onModelReady: (model) {},
        onDispose: (model) {});
  }

  Widget buildIcon(String path) {
    return SvgPicture.asset(
      path,
      width: 45,
      height: 45,
    );
  }
}
