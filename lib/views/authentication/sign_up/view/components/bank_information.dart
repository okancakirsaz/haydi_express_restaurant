part of "../sign_up_view.dart";

class BankInformation extends StatelessWidget {
  final SignUpViewModel viewModel;
  const BankInformation({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 440,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  depositInformation(),
                  paymentInformation(),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: PaddingConsts.instance.bottom10,
          width: 400,
          child: Text(
            "Girdiğiniz bilgileri istediğiniz zaman restoran profili kısmından değiştirebilirsiniz.",
            style: TextConsts.instance.regularWhite16Bold,
          ),
        ),
        PreviousAndNextButtons(
          previousPage: CourierOptions(
            viewModel: viewModel,
          ),
          nextPage: PrivacyPolicy(
            viewModel: viewModel,
          ),
          viewModel: viewModel,
          currentIndex: 5,
        )
      ],
    );
  }

  Widget depositInformation() {
    return SizedBox(
      width: 350,
      child: Column(
        children: <Widget>[
          CustomTextField(controller: viewModel.iban, hint: "IBAN Numarası"),
          CustomTextField(controller: viewModel.bankName, hint: "Banka Adı"),
          CustomTextField(
              hintStyle: TextConsts.instance.regularWhite20,
              controller: viewModel.bankAccountOwner,
              hint: "Hesap Sahibinin Adı Soyadı"),
        ],
      ),
    );
  }

  Widget paymentInformation() {
    return SizedBox(
      width: 350,
      child: Column(
        children: <Widget>[
          CustomTextField(
              controller: viewModel.cardNumber, hint: "Kart Numarası"),
          CustomTextField(
              controller: viewModel.cardOwner,
              hint: "Kart Sahibinin Adı Soyadı"),
          Row(
            children: <Widget>[
              Expanded(
                  child:
                      CustomTextField(controller: viewModel.cvv, hint: "CVV")),
              Expanded(
                  flex: 2,
                  child: CustomTextField(
                      controller: viewModel.cardExpireDate, hint: "SKT")),
            ],
          ),
        ],
      ),
    );
  }
}
