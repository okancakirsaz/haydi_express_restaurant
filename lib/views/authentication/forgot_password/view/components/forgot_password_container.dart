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
          width: 485,
          padding: PaddingConsts.instance.all20,
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
                height: 55,
                onPressed: () => viewModel.navigateToSignUp(),
                style: TextConsts.instance.regularWhite16,
                text: "Restoran Hesabı Oluşturmak İstiyorum.",
              ),
            ),
            CustomButton(
              height: 55,
              onPressed: () => viewModel.navigateLogIn(),
              style: TextConsts.instance.regularWhite16,
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
        Text(
          "Şifremi Unuttum",
          style: TextConsts.instance.regularWhite40Bold,
        ),
        const SizedBox(height: 50),
        CustomTextField(
          padding: PaddingConsts.instance.all20,
          controller: viewModel.email,
          hint: "E-Posta",
        ),
        const SizedBox(height: 50),
        CustomStateFullButton(
          onPressed: () async => await viewModel.sendResetPasswordMail(),
          text: "Gönder",
        )
      ],
    );
  }
}
