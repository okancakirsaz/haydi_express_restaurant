part of '../create_order_view.dart';

class OrderInformations extends StatelessWidget {
  final CreateOrderViewModel viewModel;
  const OrderInformations({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: PaddingConsts.instance.all20,
          child: const CreateOrderTitleElement(
            text: "Sipariş Bilgileri",
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.all10,
          child: CustomTextField(
            controller: viewModel.note,
            hint: "Sipariş notu girebilirsiniz",
            style: TextConsts.instance.regularBlack12,
            hintStyle: TextConsts.instance.regularBlack14Bold,
          ),
        ),
        CustomTextField(
          controller: viewModel.customerName,
          hint: "Müşteri Adı",
          style: TextConsts.instance.regularBlack12,
          hintStyle: TextConsts.instance.regularBlack14Bold,
        ),
        CustomTextField(
          controller: viewModel.customerPhoneNumber,
          hint: "Müşteri Telefon Numarası",
          style: TextConsts.instance.regularBlack12,
          keyboardType: TextInputType.number,
          hintStyle: TextConsts.instance.regularBlack14Bold,
        ),
        Padding(
          padding: PaddingConsts.instance.all20,
          child: CustomDropdown(
            style: TextConsts.instance.regularBlack14,
            width: 200,
            props: const <DropdownMenuEntry>[
              DropdownMenuEntry(
                label: "Kapıda Kredi Kartı",
                value: "Kapıda Kredi Kartı",
              ),
              DropdownMenuEntry(
                label: "Kapıda Nakit",
                value: "Kapıda Nakit",
              ),
              DropdownMenuEntry(
                label: "Online Ödeme",
                value: "Online Ödeme",
              ),
            ],
            hint: "Ödeme Yöntemi",
            controller: viewModel.paymentMethod,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
