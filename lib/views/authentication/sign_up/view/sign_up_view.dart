import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_ekspres_dev_tools/widgets/widgets_index.dart';
import 'package:haydi_express_restaurant/core/init/configrations/card_expire_text_formatter_config.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/sign_up_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part './components/sign_up_container.dart';
part './components/process_bar.dart';
part './components/restaurant_owner_inputs.dart';
part './components/restaurant_information_inputs.dart';
part './components/previous_and_next_buttons.dart';
part './components/mail_code_view.dart';
part './components/address_inputs.dart';
part './components/courier_option.dart';
part './components/bank_information.dart';
part './components/privacy_policy.dart';
part './components/thanks_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        viewModel: SignUpViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () => model.navigatorPop(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: PaddingConsts.instance.all20,
                        color: ColorConsts.instance.background,
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 15,
                        child: const Hero(
                          tag: "logoHero",
                          child: Logo(),
                        ),
                      ),
                    ],
                  ),
                ),
                SignUpContainer(viewModel: model),
              ],
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
          model.setInitialPage(model);
        },
        onDispose: (model) {
          model.disposeAllControllers();
        });
  }
}
