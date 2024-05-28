import 'package:flutter/material.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_button.dart';
import 'package:haydi_express_restaurant/views/adversiment/get_adversiment_view/viewmodel/get_ads_viewmodel.dart';

import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_statefull_button.dart';

class GetSearchAd extends StatelessWidget {
  final GetAdsViewModel viewModel;
  const GetSearchAd({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          CustomDropdown(
            props: viewModel.fetchMenuAsDropDownEntryList,
            hint: "Pick Menu",
            controller: viewModel.pickedMenu,
          ),
          CustomButton(onPressed: () {}, text: "Boost Restaurant"),
          CustomButton(
            onPressed: () => viewModel.openDatePicker(),
            text: "Pick Boost Expire Date",
          ),
          CustomStateFullButton(
            onPressed: () async => null,
            text: "Get Ad",
          ),
        ],
      ),
    );
  }
}
