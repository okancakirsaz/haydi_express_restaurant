part of "../sign_up_view.dart";

class RestaurantOwnerInputs extends StatelessWidget {
  final SignUpViewModel viewModel;
  const RestaurantOwnerInputs({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 450,
          child: Column(
            children: <Widget>[
              CustomTextField(controller: viewModel.ownerName, hint: "İsim"),
              CustomTextField(
                  controller: viewModel.ownerSurName, hint: "Soyisim"),
              CustomTextField(
                  controller: viewModel.ownerPhoneNumber,
                  hint: "Telefon Numarası"),
            ],
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.top20,
          child: CustomButton(
              onPressed: () => viewModel.goToPage(
                    RestaurantInformationInputs(viewModel: viewModel),
                    "Restoran Bilgilerini Giriniz",
                    1,
                    true,
                  ),
              text: "Devam Et"),
        )
      ],
    );
  }
}
