import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_ekspres_dev_tools/models/address_model.dart';
import 'package:haydi_ekspres_dev_tools/models/bucket_element_model.dart';
import 'package:haydi_ekspres_dev_tools/models/order_model.dart';
import 'package:haydi_ekspres_dev_tools/models/order_states.dart';
import 'package:haydi_ekspres_dev_tools/widgets/stat_container.dart';
import 'package:haydi_ekspres_dev_tools/widgets/widgets_index.dart';
import '../../../../core/base/view/base_view.dart';
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
