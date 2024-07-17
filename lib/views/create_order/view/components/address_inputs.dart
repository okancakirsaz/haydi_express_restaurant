part of '../create_order_view.dart';

class AddressInputs extends StatelessWidget {
  final CreateOrderViewModel viewModel;
  AddressInputs({super.key, required this.viewModel});

  final TextStyle inputHintStyle = TextConsts.instance.regularBlack16;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: PaddingConsts.instance.vertical20,
          child: const CreateOrderTitleElement(text: "Adres Bilgileri"),
        ),
        _buildProvinceInputs(),
        Padding(
          padding: PaddingConsts.instance.top10,
          child: _buildDetailsInputs(),
        )
      ],
    );
  }

  Widget _buildProvinceInputs() {
    return Row(
      children: <Widget>[
        Observer(builder: (context) {
          return CustomDropdown(
            props: viewModel.cityDropdownItems,
            hint: "Şehir",
            controller: viewModel.city,
            style: TextConsts.instance.regularBlack16Bold,
          );
        }),
        const SizedBox(width: 10),
        Observer(builder: (context) {
          return CustomDropdown(
            props: viewModel.stateDropdownItems,
            hint: "İlçe",
            controller: viewModel.state,
            style: TextConsts.instance.regularBlack16Bold,
          );
        }),
      ],
    );
  }

  Widget _buildDetailsInputs() {
    return Column(
      children: <Widget>[
        CustomTextField(
          hintStyle: inputHintStyle,
          controller: viewModel.neighborhood,
          hint: "Mahalle",
        ),
        CustomTextField(
          hintStyle: inputHintStyle,
          controller: viewModel.street,
          hint: "Sokak",
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CustomTextField(
                maxLength: 3,
                hintStyle: TextConsts.instance.regularBlack12,
                keyboardType: TextInputType.number,
                controller: viewModel.floor,
                customInputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hint: "Kat",
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomTextField(
                hintStyle: TextConsts.instance.regularBlack12,
                controller: viewModel.outDoorNumber,
                hint: "Bina Numarası",
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomTextField(
                hintStyle: TextConsts.instance.regularBlack10,
                controller: viewModel.doorNumber,
                hint: "Daire Numarası",
              ),
            ),
          ],
        ),
        CustomTextField(
          hintStyle: inputHintStyle,
          controller: viewModel.addressDirection,
          hint: "Adresi Tarif Ediniz",
        ),
      ],
    );
  }
}
