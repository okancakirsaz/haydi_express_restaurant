part of '../menu_view.dart';

class MenuStats extends StatelessWidget {
  final MenuModel data;
  final MenuViewModel viewModel;
  const MenuStats({super.key, required this.data, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => viewModel.backToMenuView(),
        ),
        toolbarHeight: 50,
      ),
      body: Center(
        child: Hero(
          tag: "menuItem",
          child: Material(
            child: Container(
              width: 950,
              height: 670,
              decoration: BoxDecoration(
                color: ColorConsts.instance.lightThird,
                borderRadius: RadiusConsts.instance.circularAll10,
                boxShadow: ColorConsts.instance.shadow,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 10,
                    decoration: BoxDecoration(
                      color: ColorConsts.instance.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                  _buildContentSkeleton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentSkeleton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: PaddingConsts.instance.all10,
          child: SizedBox(
            width: 900,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[_buildBasicContents(), _buildCreationDate()],
            ),
          ),
        ),
        Padding(
          padding: PaddingConsts.instance.top50,
          child: Row(
            children: <Widget>[
              _buildStatsLine(),
              _buildComments(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBasicContents() {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: ColorConsts.instance.background,
            borderRadius: RadiusConsts.instance.circularAll10,
            image: DecorationImage(
                image: NetworkImage(data.photoUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          width: 400,
          height: 150,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 50,
                child: ListTile(
                  title: Text(
                    data.name,
                    style: TextConsts.instance.regularWhite20Bold,
                  ),
                  subtitle: Text(
                    "${data.price}₺",
                    style: TextConsts.instance.regularWhite16,
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: ListTile(
                  leading: Text(
                    "İçerik: ",
                    style: TextConsts.instance.regularWhite16Bold,
                  ),
                  title: Text(
                    data.content,
                    style: TextConsts.instance.regularWhite16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCreationDate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Oluşturulma Tarihi",
          style: TextConsts.instance.regularWhite16Bold,
        ),
        Text(
          viewModel.parseIso8601DateFormat(data.stats.creationDate),
          style: TextConsts.instance.regularWhite16,
        ),
      ],
    );
  }

  Widget _buildStatsLine() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStatLineContainer(
          "Toplam Sipariş: ",
          "${data.stats.totalOrderCount}",
        ),
        _buildStatLineContainer(
          "Beğenilme Oranı: ",
          "${data.stats.likeRatio}%",
        ),
        _buildStatLineContainer(
          "En çok sipariş edilen saat: ",
          data.stats.mostOrderTakingHour,
        ),
        _buildStatLineContainer(
          "Toplam Gelir(Menü): ",
          "${data.stats.totalRevenue}₺",
        ),
      ],
    );
  }

  Widget _buildStatLineContainer(String title, String content) {
    return Container(
      height: 45,
      margin: PaddingConsts.instance.top10,
      constraints: const BoxConstraints(minWidth: 170, maxHeight: 45),
      padding: PaddingConsts.instance.all10,
      decoration: BoxDecoration(
        color: ColorConsts.instance.primary,
        borderRadius: RadiusConsts.instance.circularRight10,
      ),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextConsts.instance.regularWhite16,
          ),
          Text(
            content,
            style: TextConsts.instance.regularWhite16Bold,
          ),
        ],
      ),
    );
  }

  Widget _buildComments() {
    return Container(
      width: 500,
      height: 300,
      padding: PaddingConsts.instance.all10,
      margin: PaddingConsts.instance.left30,
      decoration: BoxDecoration(
        color: ColorConsts.instance.secondary,
        borderRadius: RadiusConsts.instance.circularAll10,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Yorumlar",
            style: TextConsts.instance.regularWhite20Bold,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
              itemCount: data.stats.comments.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: ColorConsts.instance.third,
                            content: SizedBox(
                              width: 400,
                              child: Text(
                                data.stats.comments[index].comment,
                                style: TextConsts.instance.regularWhite16,
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    padding: PaddingConsts.instance.all5,
                    margin: PaddingConsts.instance.all10,
                    decoration: BoxDecoration(
                      color: ColorConsts.instance.lightThird,
                      borderRadius: RadiusConsts.instance.circularAll10,
                      boxShadow: ColorConsts.instance.shadow,
                    ),
                    child: Text(
                      data.stats.comments[index].comment,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextConsts.instance.regularWhite16,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
