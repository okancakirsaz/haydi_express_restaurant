import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/radius_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_statefull_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_text_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_text_field.dart';
import 'package:haydi_express_restaurant/views/menu_view/models/menu_model.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/widgets/part_title.dart';
import '../viewmodel/menu_viewmodel.dart';

part 'components/create_preview_menu_contaier.dart';
part 'components/create_menu_inputs.dart';
part './components/preview_created_menu.dart';
part 'components/restaurant_menu.dart';
part './components/campaings_container.dart';
part './components/active_campaigns.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      viewModel: MenuViewModel(),
      onPageBuilder: (context, model) {
        return CustomScaffold(
            body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const PartTitle(
                        title: "Menü",
                        subtitle: "Ekle",
                      ),
                      subtitle: Padding(
                        padding: PaddingConsts.instance.all20,
                        child: CreatePreviewMenContainer(viewModel: model),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const PartTitle(
                        title: "Kampanyalar",
                        subtitle: "Menü",
                      ),
                      subtitle: Padding(
                          padding: PaddingConsts.instance.all20,
                          child: CampaignsContainer(
                            viewModel: model,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const PartTitle(
                    title: "Güncel Menü",
                  ),
                  subtitle: RestaurantMenu(viewModel: model),
                ),
              ),
            ],
          ),
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
