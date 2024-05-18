import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_button.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_dropdown.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_statefull_button.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/viewmodel/get_ads_viewmodel.dart';
import 'package:haydi_express_restaurant/views/adversiment/public/const/ad_types.dart';
import '../../../../core/base/view/base_view.dart';

class GetAdsView extends StatelessWidget {
  const GetAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GetAdsViewModel>(
        viewModel: GetAdsViewModel(),
        onPageBuilder: (context, model) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomDropdown(
                    props: [
                      DropdownMenuEntry(
                        value: AdTypes.instance.haydiFirsatlar,
                        label: AdTypes.instance.haydiFirsatlar,
                      ),
                    ],
                    hint: "Pick A Boost Area",
                    controller: model.boostArea,
                  ),
                  CustomDropdown(
                    props: model.fetchMenuAsDropDownEntryList,
                    hint: "Pick Menu",
                    controller: model.pickedMenu,
                  ),
                  CustomButton(
                    onPressed: () => model.openDatePicker(),
                    text: "Pick Boost Expire Date",
                  ),
                  CustomStateFullButton(
                    onPressed: () async => await model.getBoost(),
                    text: "Get Ad",
                  ),
                ],
              ),
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }
}
