import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haydi_express_restaurant/core/consts/color_consts/color_consts.dart';
import 'package:haydi_express_restaurant/core/consts/padding_consts.dart';
import 'package:haydi_express_restaurant/core/consts/radius_consts.dart';
import 'package:haydi_express_restaurant/core/consts/text_consts.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_statefull_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/part_title.dart';
import 'package:haydi_express_restaurant/views/orders/model/address_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/bucket_element_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_model.dart';
import 'package:haydi_express_restaurant/views/orders/model/order_states.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/consts/asset_consts.dart';
import '../../../core/widgets/input/custom_text_field.dart';
import '../viewmodel/orders_viewmodel.dart';

part './components/active_orders.dart';
part './components/order_widget.dart';
part './components/order_logs.dart';
part './components/cancel_reason_dialog.dart';

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
              OrderLogs(viewModel: model),
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
