part of '../menu_view.dart';

class CampaignsContainer extends StatelessWidget {
  final MenuViewModel viewModel;
  const CampaignsContainer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: ColorConsts.instance.third,
        borderRadius: RadiusConsts.instance.circularAll10,
        boxShadow: ColorConsts.instance.shadow,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: PaddingConsts.instance.all20,
              child: CustomButton(
                onPressed: () {},
                style: TextConsts.instance.regularWhite20,
                text: "Yeni Kampanya",
              ),
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.top20,
            child: ActiveCampaigns(viewModel: viewModel),
          )
        ],
      ),
    );
  }
}
