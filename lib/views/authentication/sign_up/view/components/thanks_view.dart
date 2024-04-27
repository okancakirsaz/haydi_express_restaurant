part of "../sign_up_view.dart";

class ThanksView extends StatelessWidget {
  final SignUpViewModel viewModel;
  const ThanksView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 650,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: PaddingConsts.instance.bottom25,
                child: Text(
                  "HOŞGELDİNİZ",
                  style: TextConsts.instance.regularWhite40Bold,
                ),
              ),
              Text(
                "İŞLETMENİZİ VE SİZİ ARAMIZDA GÖRMEK MUTLULUK VERİCİ",
                textAlign: TextAlign.center,
                style: TextConsts.instance.regularWhite35Bold,
              ),
            ],
          ),
        ),
        CustomButton(onPressed: () {}, text: "Menü Oluştur"),
      ],
    );
  }
}
