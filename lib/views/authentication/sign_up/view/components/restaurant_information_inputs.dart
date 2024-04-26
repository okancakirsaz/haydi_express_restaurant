part of "../sign_up_view.dart";

class RestaurantInformationInputs extends StatelessWidget {
  final SignUpViewModel viewModel;
  const RestaurantInformationInputs({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 450,
          child: Column(
            children: <Widget>[
              CustomTextField(
                  controller: viewModel.restaurantName, hint: "İşletme Adı"),
              CustomTextField(controller: viewModel.email, hint: "E-Posta"),
              CustomTextField(controller: viewModel.password, hint: "Şifre"),
              CustomTextField(
                  controller: viewModel.taxNumber, hint: "Vergi Numarası"),
            ],
          ),
        ),
        PreviousAndNextButtons(
            previousPage: RestaurantOwnerInputs(
              viewModel: viewModel,
            ),
            nextPage: Container(),
            viewModel: viewModel,
            previousTitle: viewModel.titles[0],
            nextTitle: "Title Here")
      ],
    );
  }
}
