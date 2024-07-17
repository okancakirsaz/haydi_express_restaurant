part of '../create_order_view.dart';

class OrderDetails extends StatelessWidget {
  final CreateOrderViewModel viewModel;
  const OrderDetails({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: PaddingConsts.instance.horizontal10,
          child: const CreateOrderTitleElement(text: "Sipariş Detayları"),
        ),
        Container(
          width: 300,
          height: 485,
          margin: PaddingConsts.instance.left10,
          padding: PaddingConsts.instance.all10,
          decoration: BoxDecoration(
            color: ColorConsts.instance.blurGrey,
            borderRadius: RadiusConsts.instance.circularAll5,
          ),
          child: Observer(builder: (context) {
            return ListView.builder(
              itemCount: viewModel.selectedItems.length,
              itemBuilder: (context, i) {
                return BucketElement(
                  index: i,
                  data: viewModel.selectedItems[i],
                  viewModel: viewModel,
                );
              },
            );
          }),
        ),
        Padding(
          padding: PaddingConsts.instance.top20,
          child: Padding(
            padding: PaddingConsts.instance.horizontal90,
            child: CustomStateFullButton(
              onPressed: () async => await viewModel.createOrder(),
              style: TextConsts.instance.regularWhite16,
              text: "Onayla",
            ),
          ),
        ),
      ],
    );
  }
}
