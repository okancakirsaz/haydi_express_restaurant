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
                onPressed: () {},
                style: TextConsts.instance.regularWhite20,
                text: "Restoran Hesabı Oluşturmak İstiyorum.",
              ),
            ),
            CustomButton(
              onPressed: () => viewModel.navigateToForgotPassword(),
              style: TextConsts.instance.regularWhite20,
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
        CustomTextField(
          padding: PaddingConsts.instance.all20,
          controller: viewModel.password,
          hint: "Şifre",
        ),
        Padding(
          padding: PaddingConsts.instance.top10,
          child: CustomButton(
              onPressed: () async => viewModel.tryToLogIn(), text: "Giriş Yap"),
        )
      ],
    );
  }
}
