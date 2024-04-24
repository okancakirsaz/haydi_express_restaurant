import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/consts/color_consts/color_consts.dart';
import '../../../../core/consts/padding_consts.dart';
import '../../../../core/consts/radius_consts.dart';
import '../../../../core/consts/text_consts.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/logo.dart';
import '../viewmodel/forgot_password_viewmodel.dart';

part "./components/forgot_password_container.dart";

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
        viewModel: ForgotPasswordViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 550,
                    height: 550,
                    child: Hero(
                      tag: "logoHero",
                      child: Padding(
                        padding: PaddingConsts.instance.all20,
                        child: const Logo(),
                      ),
                    ),
                  ),
                  ForgotPasswordContainer(viewModel: model),
                ],
              ),
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }
}
