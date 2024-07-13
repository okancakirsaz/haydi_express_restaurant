import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/part_title.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_model.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/orders_viewmodel.dart';

part './components/active_orders.dart';
part './components/order_widget.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OrdersViewModel>(
        viewModel: OrdersViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
              body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ActiveOrders(viewModel: model),
              //TODO: Add order history
              const SizedBox(
                width: 400,
                height: 400,
              ),
            ],
          ));
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }
}
