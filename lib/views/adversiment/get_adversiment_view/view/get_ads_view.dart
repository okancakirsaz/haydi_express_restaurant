import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_ekspres_dev_tools/widgets/custom_button.dart';
import 'package:haydi_ekspres_dev_tools/widgets/custom_dropdown.dart';
import 'package:haydi_ekspres_dev_tools/widgets/custom_statefull_button.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/consts/get_ads_texts.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/viewmodel/get_ads_viewmodel.dart';
import 'package:haydi_express_restaurant/views/adversiment/public/const/ad_types.dart';
import '../../../../core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part './components/process_container.dart';
part './components/menu_boost.dart';
part './components/restaurant_boost.dart';
part './components/haydi_firsatlar_info.dart';
part './components/suggestions_info.dart';

class GetAdsView extends StatelessWidget {
  const GetAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GetAdsViewModel>(
      viewModel: GetAdsViewModel(),
      onPageBuilder: (context, model) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProcessContainer(viewModel: model),
          ],
        );
      },
      onModelReady: (model) {
        model.initVm(model);
        model.init();
        model.setContext(context);
      },
      onDispose: (model) {},
    );
  }
}
