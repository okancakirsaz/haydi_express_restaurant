part of '../orders_view.dart';

class OrderLogs extends StatelessWidget {
  final OrdersViewModel viewModel;
  const OrderLogs({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const PartTitle(
            title: "Sipariş Geçmişi",
            subtitle: "Siparişler",
          ),
          Padding(
            padding: PaddingConsts.instance.all10,
            child: CustomStateFullButton(
              onPressed: () async => await viewModel.pickDate(),
              text: "Tarih Aralığı Seçebilirsiniz",
              width: 300,
              style: TextConsts.instance.regularWhite16,
            ),
          ),
          viewModel.selectedTimeRange.isNotEmpty
              ? Text(
                  "${viewModel.parseIso8601DateFormat(viewModel.selectedTimeRange[0])} - ${viewModel.parseIso8601DateFormat(viewModel.selectedTimeRange[1])} aralığındaki veriler",
                  textAlign: TextAlign.center,
                  style: TextConsts.instance.regularBlack14,
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Observer(builder: (context) {
                return StatContainer(
                  desc: "Toplam\nKazanç",
                  value: "${viewModel.totalRevenue}₺",
                );
              }),
              Observer(builder: (context) {
                return StatContainer(
                  desc: "Sipariş\nSayısı",
                  value: "${viewModel.orderLogCount}",
                );
              }),
            ],
          ),
          Container(
            margin: PaddingConsts.instance.top20,
            height: 300,
            width: 430,
            child: _buildLogs(),
          ),
        ],
      );
    });
  }

  Widget _buildLogs() {
    return FutureBuilder<bool>(
      future: viewModel.getOrderLogs(),
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
      if (viewModel.orderLogs.isEmpty) {
        return Center(
          child: Text(
            "Geçmiş siparişiniz bulunmamakta.",
            style: TextConsts.instance.regularBlack16,
          ),
        );
      } else {
        return ListView.builder(
          itemCount: viewModel.orderLogs.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: PaddingConsts.instance.bottom15,
              child: OrderWidget(
                index: i,
                isOrderExpired: true,
                viewModel: viewModel,
                data: viewModel.orderLogs[i],
              ),
            );
          },
        );
      }
    });
  }

  Widget _buildError() {
    return Text(
      "Beklenmeyen bir sorun oluştu.",
      style: TextConsts.instance.regularBlack18Bold,
    );
  }
}
