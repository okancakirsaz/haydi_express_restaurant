import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_text_button.dart';
import 'package:haydi_express_restaurant/core/widgets/part_title.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/profile_viewmodel.dart';

part './components/ads_navigator.dart';
part './components/account_informations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        viewModel: ProfileViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
              body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    AdsNavigator(viewModel: model),
                    Padding(
                      padding: PaddingConsts.instance.horizontal30,
                      child: Divider(
                        color: ColorConsts.instance.black,
                        thickness: 1,
                      ),
                    ),
                    AccountInformation(viewModel: model),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _buildActions(model),
              ),
            ],
          ));
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }

  Widget _buildActions(ProfileViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CustomTextButton(
          style: TextConsts.instance.regularPrimary16Underlined,
          onPressed: () async => await model.signOut(),
          text: "Çıkış Yap",
        ),
        _buildProfileViewCustomButton(
          Text(
            "Gizlilik\nPolitikası",
            textAlign: TextAlign.center,
            style: TextConsts.instance.regularWhite14,
          ),
          () {},
        ),
        _buildProfileViewCustomButton(
          Text(
            "Kullanıcı\nSözleşmesi",
            textAlign: TextAlign.center,
            style: TextConsts.instance.regularWhite14,
          ),
          () {},
        ),
        _buildProfileViewCustomButton(
          Icon(
            Icons.comment,
            color: ColorConsts.instance.background,
            size: 30,
          ),
          () {},
        ),
      ],
    );
  }

  Widget _buildProfileViewCustomButton(Widget content, VoidCallback onPressed) {
    return Container(
      margin: PaddingConsts.instance.all5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 8,
            right: 8,
          ),
          backgroundColor: ColorConsts.instance.lightThird,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          elevation: 1,
        ),
        child: content,
      ),
    );
  }
}
