part of "../profile_view.dart";

class AdsNavigator extends StatelessWidget {
  final ProfileViewModel viewModel;
  const AdsNavigator({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const PartTitle(
          title: "Reklam İşlemleri",
          subtitle: "Profil",
        ),
        Padding(
          padding: PaddingConsts.instance.all20,
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam suscipit nulla quam. Vestibulum id quam et lacus facilisis mollis id et tellus. Maecenas orci nunc, faucibus non porta et, dictum malesuada est. Duis eu tempor quam, sit ",
            style: TextConsts.instance.regularBlack16,
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.all20,
          child: CustomButton(
            onPressed: () => viewModel.navigateToAds,
            text: "Seçenekler",
            style: TextConsts.instance.regularWhite16,
            backgroundColor: ColorConsts.instance.lightThird,
          ),
        ),
      ],
    );
  }
}
