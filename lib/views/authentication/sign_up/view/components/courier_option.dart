part of "../sign_up_view.dart";

class CourierOptions extends StatelessWidget {
  final SignUpViewModel viewModel;
  const CourierOptions({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 470,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  courierButton(AssetConsts.instance.courier,
                      "Paket Taşıma Hizmeti İstemiyorum", false),
                  courierButton(AssetConsts.instance.haydiCourier,
                      "Paket Taşıma Hizmeti Almak İstiyorum", true),
                ],
              ),
              Padding(
                padding: PaddingConsts.instance.top50,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomButton(
                    onPressed: () => viewModel.goToPage(
                      AddressInputs(viewModel: viewModel),
                      viewModel.titles[3],
                      3,
                      false,
                    ),
                    text: "Önceki Sayfa",
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget courierButton(String iconPath, String text, bool option) {
    return InkWell(
      onTap: () => viewModel.pickCourierOption(option, viewModel),
      child: Container(
        width: 340,
        height: 340,
        decoration: BoxDecoration(
          color: ColorConsts.instance.lowOpacityOrange,
          borderRadius: RadiusConsts.instance.circularAll20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: PaddingConsts.instance.top10,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextConsts.instance.regularWhite25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
