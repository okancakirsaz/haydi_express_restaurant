import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/menu_viewmodel.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      viewModel: MenuViewModel(),
      onPageBuilder: (context, model) {
        return const CustomScaffold(
            body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[],
            ),
          ],
        ));
      },
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onDispose: (model) {},
    );
  }
}
