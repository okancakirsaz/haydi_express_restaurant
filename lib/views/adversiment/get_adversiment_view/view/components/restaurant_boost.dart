part of '../get_ads_view.dart';

class RestaurantBoost extends StatelessWidget {
  final GetAdsViewModel viewModel;
  const RestaurantBoost({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConsts.instance.left30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: PaddingConsts.instance.all10,
            child: CustomDropdown(
              width: 230,
              props: [
                DropdownMenuEntry(
                  value: AdTypes.instance.suggestions,
                  label: AdTypes.instance.suggestions,
                ),
              ],
              hint: "Reklam Alanı",
              style: TextConsts.instance.regularWhite14,
              controller: viewModel.boostArea,
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.all10,
            child: Padding(
              padding: PaddingConsts.instance.left50,
              child: CustomStateFullButton(
                width: 100,
                style: TextConsts.instance.regularWhite14,
                backgroundColor: ColorConsts.instance.lightSecondary,
                onPressed: () => viewModel.openDatePicker(),
                text: "Bitiş Tarihi",
              ),
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.left50,
            child: CustomStateFullButton(
              style: TextConsts.instance.regularWhite16,
              onPressed: () async => await viewModel.getBoost(),
              text: "Devam Et",
            ),
          ),
        ],
      ),
    );
  }
}
