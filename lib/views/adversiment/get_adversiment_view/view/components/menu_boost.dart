part of '../get_ads_view.dart';

class MenuBoost extends StatelessWidget {
  final GetAdsViewModel viewModel;
  const MenuBoost({super.key, required this.viewModel});

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
              props: viewModel.boostAreas,
              hint: "Reklam Alanı",
              style: TextConsts.instance.regularWhite14,
              controller: viewModel.boostArea,
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.all10,
            child: CustomDropdown(
              width: 230,
              props: viewModel.fetchMenuAsDropDownEntryList,
              hint: "Menü",
              style: TextConsts.instance.regularWhite14,
              controller: viewModel.pickedMenu,
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
