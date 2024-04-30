import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/radius_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_statefull_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_text_field.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/menu_viewmodel.dart';

part 'components/create_preview_menu_contaier.dart';
part 'components/create_menu_inputs.dart';
part './components/preview_created_menu.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      viewModel: MenuViewModel(),
      onPageBuilder: (context, model) {
        return CustomScaffold(
            body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: PaddingConsts.instance.all20,
                    child: CreatePreviewMenContainer(viewModel: model),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: PaddingConsts.instance.all20,
                    child: Container(
                      height: 450,
                      color: ColorConsts.instance.third,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
      },
      onModelReady: (model) {
        model.init();
        model.setContext(context);
        model.fetchCreateOrPreviewMenuWidget(
            CreateMenuInputs(
              viewModel: model,
            ),
            false);
      },
      onDispose: (model) {},
    );
  }
}
