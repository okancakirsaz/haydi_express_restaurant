part of '../menu_view.dart';

class ActiveCampaigns extends StatelessWidget {
  final MenuViewModel viewModel;
  const ActiveCampaigns({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: ListTile(
        title: Text(
          "Aktif",
          style: TextConsts.instance.regularPrimary20,
        ),
        subtitle: Observer(builder: (context) {
          return Padding(
            padding: PaddingConsts.instance.top40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitles(),
                const SizedBox(
                  width: 360,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                buildCampaignsList(),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildCampaignsList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: viewModel.menusOnCampaigns.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: PaddingConsts.instance.top10,
              child: buildActiveCampaignsObject(
                viewModel.menusOnCampaigns[index],
              ),
            );
          }),
    );
  }

  Widget buildActiveCampaignsObject(MenuModel data) {
    return SizedBox(
      width: 400,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 150,
            child: Padding(
              padding: PaddingConsts.instance.left10,
              child: Text(
                data.name,
                style: TextConsts.instance.regularWhite16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            width: 90,
            child: Text(
              "%${data.discountAmount}",
              style: TextConsts.instance.regularWhite16,
            ),
          ),
          SizedBox(
            width: 150,
            child: Text(
              viewModel.parseIso8601DateFormat(data.discountFinishDate!),
              style: TextConsts.instance.regularWhite16,
            ),
          ),
          CustomTextButton(
            onPressed: () async => await viewModel.cancelCampaign(data.menuId),
            style: TextConsts.instance.regularPrimary16Underlined,
            text: "İptal Et",
          ),
        ],
      ),
    );
  }

  Widget _buildTitles() {
    return SizedBox(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Menü Adı",
            style: TextConsts.instance.regularWhite16Bold,
          ),
          Text(
            "İndirim Oranı",
            style: TextConsts.instance.regularWhite16Bold,
          ),
          Text(
            "Bitiş Tarihi",
            style: TextConsts.instance.regularWhite16Bold,
          ),
        ],
      ),
    );
  }
}
