part of "../sign_up_view.dart";

class ProcessBar extends StatelessWidget {
  final SignUpViewModel viewModel;
  const ProcessBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConsts.instance.all10,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            width: 840,
            height: 16,
            decoration: BoxDecoration(
                color: ColorConsts.instance.background,
                borderRadius: RadiusConsts.instance.circularAll100),
          ),
          Observer(builder: (context) {
            return Container(
              width: viewModel.process,
              height: 16,
              decoration: BoxDecoration(
                color: ColorConsts.instance.primary,
                borderRadius: RadiusConsts.instance.circularAll100,
              ),
            );
          }),
        ],
      ),
    );
  }
}
