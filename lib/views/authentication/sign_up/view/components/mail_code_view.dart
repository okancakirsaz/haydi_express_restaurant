part of "../sign_up_view.dart";

class MailCodeView extends StatelessWidget {
  final SignUpViewModel viewModel;
  const MailCodeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                  controller: viewModel.mailVerification,
                  hint: "Doğrulama Kodu"),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
        PreviousAndNextButtons(
            previousPage: RestaurantInformationInputs(
              viewModel: viewModel,
            ),
            nextPage: AddressInputs(
              viewModel: viewModel,
            ),
            viewModel: viewModel,
            previousIndex: 1,
            nextIndex: 3)
      ],
    );
  }
}
