part of '../active_ads_view.dart';

class BoostElement extends StatelessWidget {
  final ActiveAdsViewModel viewModel;
  final BoostRestaurantOrMenuModel boostData;
  const BoostElement(
      {super.key, required this.boostData, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return buildItem(context);
  }

  Widget buildItem(BuildContext context) {
    return Container(
      margin: PaddingConsts.instance.all10,
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        boxShadow: ColorConsts.instance.shadow,
        color: ColorConsts.instance.lightThird,
        borderRadius: RadiusConsts.instance.circularAll10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                _decorativeLine(),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: PaddingConsts.instance.top10,
                    child: _itemFields(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _decorativeLine() {
    return Container(
      width: 10,
      decoration: BoxDecoration(
        color: ColorConsts.instance.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
        ),
      ),
    );
  }

  Widget _itemFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: PaddingConsts.instance.left10,
          child: Text(
            boostData.isRestaurant
                ? "Restoran Öne Çıkarma"
                : boostData.menuName!,
            style: TextConsts.instance.regularWhite16,
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.left10,
          child: Text(
            boostData.boostArea,
            style: TextConsts.instance.regularPrimary16Bold,
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.left10,
          child: Text(
            viewModel.parseIso8601DateFormat(boostData.expireDate),
            style: TextConsts.instance.regularWhite14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
