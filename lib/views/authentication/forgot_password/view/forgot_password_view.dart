import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_ekspres_dev_tools/widgets/widgets_index.dart';
import '../../../../core/base/view/base_view.dart';
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
