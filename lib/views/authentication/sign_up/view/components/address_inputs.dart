part of "../sign_up_view.dart";

class AddressInputs extends StatelessWidget {
  final SignUpViewModel viewModel;
  const AddressInputs({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 450,
          height: 440,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: CustomDropdown(
                  props: const [
                    DropdownMenuEntry(
                        value: "Afyonkarahisar", label: "Afyonkarahisar")
                  ],
                  hint: "Şehir Seçiniz",
                  width: 240,
                  controller: viewModel.city,
                ),
              ),
              CustomTextField(
                  controller: viewModel.addressLineOne, hint: "Adres Satırı 1"),
              CustomTextField(
                  controller: viewModel.addressLineTwo, hint: "Adres Satırı 2"),
            ],
          ),
        ),
        PreviousAndNextButtons(
          previousPage: MailCodeView(
            viewModel: viewModel,
          ),
          nextPage: CourierOptions(
            viewModel: viewModel,
          ),
          viewModel: viewModel,
          previousIndex: 2,
          nextIndex: 4,
        )
      ],
    );
  }
}
