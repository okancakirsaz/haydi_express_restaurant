part of '../orders_view.dart';

class OrderWidget extends StatelessWidget {
  final OrdersViewModel viewModel;
  final OrderModel data;
  const OrderWidget({super.key, required this.viewModel, required this.data});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        data.customerName,
        style: TextConsts.instance.regularThird18Bold,
        overflow: TextOverflow.ellipsis,
      ),
      //TODO: Contuniue with here
      subtitle: Text(
          "${viewModel.parseIso8601DateFormatDetailed(data.orderCreationDate)}\n${data.customerPhoneNumber}"),
    );
  }
}
