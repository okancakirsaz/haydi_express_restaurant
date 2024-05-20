import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/consts/app_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/widgets/custom_app_bar/custom_app_bar.dart';
import '../viewmodel/main_viewmodel.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
        viewModel: MainViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
              appBar: CustomAppBar(
                context,
                title: AppConst.restaurantName,
                mainViewModel: model,
              ).build(),
              body: Observer(builder: (context) {
                return model.page;
              }));
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }
}
