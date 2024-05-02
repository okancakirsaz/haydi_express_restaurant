part of '../menu_view.dart';

class AddCampaign extends StatelessWidget {
  final MenuViewModel viewModel;
  const AddCampaign({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConsts.instance.all20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: PaddingConsts.instance.all10,
              child: Text(
                "Ekle",
                style: TextConsts.instance.regularPrimary20,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: PaddingConsts.instance.all10,
                child: CustomDropdown(
                  width: 200,
                  props: viewModel.fetchAllMenuInDropdown(),
                  hint: "Menü Seçiniz",
                  controller: viewModel.pickedMenu,
                ),
              ),
              Padding(
                padding: PaddingConsts.instance.all10,
                child: CustomDropdown(
                  width: 200,
                  props: const [
                    DropdownMenuEntry(value: "%10", label: "%10"),
                    DropdownMenuEntry(value: "%15", label: "%15"),
                    DropdownMenuEntry(value: "%20", label: "%20"),
                    DropdownMenuEntry(value: "%25", label: "%25"),
                    DropdownMenuEntry(value: "%40", label: "%40"),
                    DropdownMenuEntry(value: "%50", label: "%50"),
                    DropdownMenuEntry(value: "%60", label: "%60"),
                    DropdownMenuEntry(value: "%75", label: "%75"),
                    DropdownMenuEntry(value: "%85", label: "%85"),
                  ],
                  hint: "İndirim Oranı",
                  controller: viewModel.discountAmount,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: PaddingConsts.instance.all10,
              child: CustomButton(
                onPressed: () async => await viewModel.openDatePicker(),
                style: TextConsts.instance.regularWhite14,
                text: "Bitiş Tarihi Seçiniz",
                backGroundColor: ColorConsts.instance.lightThird,
              ),
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.all10,
            child: CustomStateFullButton(
              onPressed: () async => await viewModel.addCampaign(),
              style: TextConsts.instance.regularWhite20,
              text: "Ekle",
            ),
          ),
        ],
      ),
    );
  }
}
