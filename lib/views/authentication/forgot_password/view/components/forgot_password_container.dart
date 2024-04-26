part of "../forgot_password_view.dart";

class ForgotPasswordContainer extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;
  const ForgotPasswordContainer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 535,
          padding: PaddingConsts.instance.all20,
          height: 624,
          margin: PaddingConsts.instance.all20,
          decoration: BoxDecoration(
            color: ColorConsts.instance.third,
            borderRadius: RadiusConsts.instance.circularAll40,
          ),
          child: _buildInputs(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: PaddingConsts.instance.horizontal10,
              child: CustomButton(
                width: 290,
                height: 65,
                onPressed: () => viewModel.navigateToSignUp(),
                style: TextConsts.instance.regularWhite20,
                text: "Restoran Hesabı Oluşturmak İstiyorum.",
              ),
            ),
            CustomButton(
              onPressed: () => viewModel.navigateLogIn(),
              style: TextConsts.instance.regularWhite20,
              text: "Giriş Yap",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputs() {
    return Column(
      children: <Widget>[
        Padding(
          padding: PaddingConsts.instance.bottom50,
          child: Text(
            "Şifremi Unuttum",
            style: TextConsts.instance.regularWhite40Bold,
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.top50,
          child: CustomTextField(
            padding: PaddingConsts.instance.all20,
            controller: viewModel.email,
            hint: "E-Posta",
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.top10,
          child: CustomStateFullButton(
              onPressed: () async => await viewModel.sendResetPasswordMail(),
              text: "Gönder"),
        )
      ],
    );
  }
}
