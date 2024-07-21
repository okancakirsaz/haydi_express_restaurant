part of '../get_ads_view.dart';

class SuggestionsInfo extends StatelessWidget {
  const SuggestionsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 550,
      height: 342,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 45,
            child: Image.asset(
              width: 250,
              height: 300,
              AssetConsts.instance.searchSuggestions,
            ),
          ),
          Positioned(
            left: 160,
            top: 275,
            child: SizedBox(
                width: 300,
                child: Text(
                  GetAdsTexts.instance.descriptionSuggestions,
                  style: TextConsts.instance.regularBlack12,
                )),
          )
        ],
      ),
    );
  }
}
