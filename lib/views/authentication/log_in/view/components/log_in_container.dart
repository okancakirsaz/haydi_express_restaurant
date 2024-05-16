part of "../log_in_view.dart";

class LogInContainer extends StatelessWidget {
  final LogInViewModel viewModel;
  const LogInContainer({super.key, required this.viewModel});

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
              onPressed: () => viewModel.navigateToForgotPassword(),
              height: 55,
              style: TextConsts.instance.regularWhite16,
              text: "Şifremi Unuttum",
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
            "Restoran Girişi",
            style: TextConsts.instance.regularWhite40Bold,
          ),
        ),
        CustomTextField(
          padding: PaddingConsts.instance.all20,
          controller: viewModel.email,
          hint: "E-Posta",
        ),
        CustomPasswordField(
          padding: PaddingConsts.instance.all20,
          controller: viewModel.password,
          hint: "Şifre",
        ),
        Padding(
          padding: PaddingConsts.instance.top10,
          child: CustomStateFullButton(
              onPressed: () async => viewModel.tryToLogIn(
                  viewModel.email.text, viewModel.password.text),
              text: "Giriş Yap"),
        )
      ],
    );
  }
}
