part of "../sign_up_view.dart";

class PrivacyPolicy extends StatelessWidget {
  final SignUpViewModel viewModel;
  const PrivacyPolicy({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 450,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: PaddingConsts.instance.bottom50,
                child: CustomButton(
                  width: 415,
                  onPressed: () {},
                  text: "Gizlilik Politikası",
                  backgroundColor: ColorConsts.instance.lightThird,
                ),
              ),
              CustomButton(
                width: 415,
                onPressed: () {},
                text: "Kullanıcı Sözleşmesi",
                backgroundColor: ColorConsts.instance.lightThird,
              ),
            ],
          ),
        ),
        PreviousAndNextButtons(
          previousPage: BankInformation(
            viewModel: viewModel,
          ),
          nextText: "Kabul Et",
          customFunctionToNext: () => viewModel.goToFinalPage(viewModel),
          viewModel: viewModel,
          currentIndex: 6,
        )
      ],
    );
  }
}
