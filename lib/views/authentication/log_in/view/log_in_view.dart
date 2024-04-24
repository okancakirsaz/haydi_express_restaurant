import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/radius_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_text_field.dart';
import 'package:haydi_express_restaurant/core/widgets/logo.dart';
import 'package:haydi_express_restaurant/views/authentication/log_in/viewmodel/log_in_viewmodel.dart';
import '../../../../core/base/view/base_view.dart';

part "components/log_in_container.dart";

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LogInViewModel>(
        viewModel: LogInViewModel(),
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
                  const LogInContainer(),
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
