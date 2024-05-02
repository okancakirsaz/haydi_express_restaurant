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
          return Column(
            children: <Widget>[
              _buildTitles(),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
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
              ),
            ],
          );
        }),
      ),
    );
  }
  //TODO:Contuniue with listing campaigns

  Widget buildActiveCampaignsObject(MenuModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          data.name,
          style: TextConsts.instance.regularWhite16,
        ),
        Text(
          "%${data.discountAmount}",
          style: TextConsts.instance.regularWhite16,
        ),
        Text(
          data.discountFinishDate!,
          style: TextConsts.instance.regularWhite16,
        ),
        CustomTextButton(
          onPressed: () {},
          style: TextConsts.instance.regularPrimary16Underlined,
          text: "İptal Et",
        ),
      ],
    );
  }

  Widget _buildTitles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
