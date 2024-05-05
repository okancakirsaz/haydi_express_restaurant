part of '../menu_view.dart';

class RestaurantMenu extends StatelessWidget {
  final MenuViewModel viewModel;
  const RestaurantMenu({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuModel>?>(
        future: viewModel.getRestaurantMenu(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<MenuModel> data = viewModel.restaurantMenu;

            return Observer(builder: (context) {
              return Hero(
                tag: "menuItem",
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width <= 1300 ? 2 : 3,
                      childAspectRatio: 2),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return buildMenuItem(data[index]);
                  },
                ),
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: ColorConsts.instance.primary,
              ),
            );
          }
        });
  }

  Widget buildMenuItem(MenuModel data) {
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
                  child: _itemPhoto(data.photoUrl),
                ),
                Expanded(
                  flex: 2,
                  child: _itemFields(data),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConsts.instance.blurGrey,
                  borderRadius: RadiusConsts.instance.circularBottom10),
              child: _itemSettings(data),
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

  Widget _itemPhoto(String url) {
    return Container(
      width: 200,
      height: 200,
      margin: PaddingConsts.instance.all5,
      decoration: BoxDecoration(
        color: ColorConsts.instance.background,
        borderRadius: RadiusConsts.instance.circularAll20,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _itemFields(MenuModel data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 350,
          child: ListTile(
            title: Text(
              data.name,
              style: TextConsts.instance.regularWhite20Bold,
            ),
            subtitle: Text("${data.price}₺",
                style: TextConsts.instance.regularWhite16),
          ),
        ),
        SizedBox(
          width: 220,
          child: ListTile(
            title: Text(
              data.content,
              style: TextConsts.instance.regularWhite14,
            ),
            leading:
                Text("İçerik: ", style: TextConsts.instance.regularWhite14Bold),
          ),
        ),
      ],
    );
  }

  Widget _itemSettings(MenuModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _customItemSettingsButton(
            () => viewModel.navigateToMenuStats(data, viewModel),
            "İstatistikler"),
        Row(
          children: <Widget>[
            _customItemSettingsButton(() {}, "Düzenle"),
            _customItemSettingsButton(() {}, "Sil"),
          ],
        )
      ],
    );
  }

  Widget _customItemSettingsButton(VoidCallback onPressed, String text) {
    return CustomTextButton(
        onPressed: onPressed,
        style: TextConsts.instance.regularWhite16,
        text: text);
  }
}
