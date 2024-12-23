import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_ekspres_dev_tools/constants/color_consts.dart';
import 'package:haydi_ekspres_dev_tools/constants/padding_consts.dart';
import 'package:haydi_ekspres_dev_tools/constants/radius_consts.dart';
import 'package:haydi_ekspres_dev_tools/constants/text_consts.dart';
import 'package:haydi_ekspres_dev_tools/models/menu_model.dart';
import 'package:haydi_ekspres_dev_tools/widgets/widgets_index.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/menu_viewmodel.dart';

part './components/tags_list.dart';
part 'components/create_preview_menu_contaier.dart';
part 'components/create_menu_inputs.dart';
part './components/preview_created_menu.dart';
part 'components/restaurant_menu.dart';
part './components/campaings_container.dart';
part './components/active_campaigns.dart';
part './components/add_campaign.dart';
part './components/menu_stats.dart';
part './components/edit_menu.dart';

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
                        child: CreatePreviewMenuContainer(viewModel: model),
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
                width: double.infinity,
                height: 600,
                child: RestaurantMenu(viewModel: model),
              ),
            ],
          ),
        ));
      },
      onModelReady: (model) {
        model.init();
        model.setContext(context);
        model.fetchObservableWidgets(CreateMenuInputs(viewModel: model),
            ActiveCampaigns(viewModel: model));
      },
      onDispose: (model) {},
    );
  }
}
