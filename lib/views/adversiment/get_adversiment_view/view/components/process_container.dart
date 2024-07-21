part of '../get_ads_view.dart';

class ProcessContainer extends StatelessWidget {
  final GetAdsViewModel viewModel;
  const ProcessContainer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 850,
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(builder: (context) {
            return Padding(
              padding: PaddingConsts.instance.bottom5,
              child: Text(
                viewModel.title,
                style: TextConsts.instance.regularBlack16Bold,
              ),
            );
          }),
          Stack(
            children: <Widget>[
              Container(
                padding: PaddingConsts.instance.all10,
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                  boxShadow: ColorConsts.instance.shadow,
                  color: ColorConsts.instance.lightThird,
                  borderRadius: RadiusConsts.instance.circularAll10,
                ),
                child: Observer(
                  builder: (context) {
                    return viewModel.content ?? const SizedBox();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 300,
                ),
                child: Observer(builder: (context) {
                  return viewModel.info ?? const SizedBox();
                }),
              ),
            ],
          ),
          Observer(builder: (context) {
            return Padding(
              padding: PaddingConsts.instance.top10,
              child: CustomButton(
                onPressed: () => viewModel.changeContent(),
                text: viewModel.buttonText,
                width: 300,
                style: TextConsts.instance.regularWhite14,
              ),
            );
          })
        ],
      ),
    );
  }
}
