import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_statefull_button.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/widgets/button/custom_button.dart';
import '../../../../core/widgets/input/custom_text_field.dart';
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
                    width: 450,
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
