import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/button/custom_statefull_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/part_title.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/consts/color_consts/color_consts.dart';
import '../../../core/consts/padding_consts.dart';
import '../../../core/consts/radius_consts.dart';
import '../../../core/consts/text_consts.dart';
import '../../../core/widgets/discount_container.dart';
import '../../../core/widgets/input/custom_dropdown.dart';
import '../../../core/widgets/input/custom_text_field.dart';
import '../../../core/widgets/menu_rating_stars.dart';
import '../../menu_view/models/menu_model.dart';
import '../../orders/model/bucket_element_model.dart';
import '../viewmodel/create_order_viewmodel.dart';

part './components/address_inputs.dart';
part './components/create_order_title_element.dart';
part './components/order_informations.dart';
part './components/order_details.dart';
part './components/menu_select_part.dart';
part './components/vertical_list_minimized_menu.dart';
part './components/count_dialog.dart';
part './components/bucket_element.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateOrderViewModel>(
      viewModel: CreateOrderViewModel(),
      onPageBuilder: (context, model) {
        return CustomScaffold(
          appBar: AppBar(
            title: const PartTitle(
              title: "Sipariş Oluştur",
              subtitle: "Siparişler",
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: PaddingConsts.instance.left10,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AddressInputs(viewModel: model),
                        OrderInformations(
                          viewModel: model,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              OrderDetails(viewModel: model),
              MenuSelectPart(
                viewModel: model,
              ),
            ],
          ),
        );
      },
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onDispose: (model) {
        model.dispose();
      },
    );
  }
}
