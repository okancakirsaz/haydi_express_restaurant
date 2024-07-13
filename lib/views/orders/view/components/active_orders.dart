part of '../orders_view.dart';

class ActiveOrders extends StatelessWidget {
  final OrdersViewModel viewModel;
  const ActiveOrders({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const PartTitle(
          title: "Aktif Siparişler",
          subtitle: "Siparişler",
        ),
        Padding(
          padding: PaddingConsts.instance.all10,
          child: viewModel.isRestaurantPreferredHe
              ? CustomButton(
                  onPressed: () {}, text: "Sipariş Oluştur", width: 200)
              : const SizedBox(),
        ),
        Container(
            margin: PaddingConsts.instance.top20,
            height: 400,
            width: 400,
            child: _buildActiveOrders()),
      ],
    );
  }

  Widget _buildActiveOrders() {
    return FutureBuilder<bool>(
      future: viewModel.getActiveOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!) {
            return _buildListView();
          } else {
            return Center(child: _buildError());
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorConsts.instance.third,
            ),
          );
        }
      },
    );
  }

  Widget _buildListView() {
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: viewModel.activeOrders.length,
        itemBuilder: (context, i) {
          return OrderWidget(
              viewModel: viewModel, data: viewModel.activeOrders[i]);
        },
      );
    });
  }

  Widget _buildError() {
    return Text(
      "Beklenmeyen bir sorun oluştu.",
      style: TextConsts.instance.regularBlack18Bold,
    );
  }
}
