part of "../sign_up_view.dart";

class SignUpContainer extends StatelessWidget {
  final SignUpViewModel viewModel;
  const SignUpContainer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 930,
            child: Text(
              viewModel.title,
              style: TextConsts.instance.regularBlack36Bold,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 1010,
            height: 610,
            decoration: BoxDecoration(
              color: ColorConsts.instance.third,
              borderRadius: RadiusConsts.instance.circularAll40,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(width: 900, height: 570, child: viewModel.page),
                ProcessBar(viewModel: viewModel),
              ],
            ),
          ),
        ],
      );
    });
  }
}
