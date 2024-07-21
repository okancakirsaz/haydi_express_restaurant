part of '../get_ads_view.dart';

class HaydiFirsatlarInfo extends StatelessWidget {
  const HaydiFirsatlarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 550,
      height: 342,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            child: Image.asset(
              width: 250,
              height: 300,
              AssetConsts.instance.hf1,
            ),
          ),
          Positioned(
            bottom: 90,
            left: 245,
            child: Image.asset(
              width: 200,
              height: 250,
              AssetConsts.instance.hf2,
            ),
          ),
          Positioned(
            left: 260,
            top: 260,
            child: SizedBox(
                width: 300,
                child: Text(
                  GetAdsTexts.instance.descriptionHaydiFirsatlar,
                  style: TextConsts.instance.regularBlack12,
                )),
          )
        ],
      ),
    );
  }
}
