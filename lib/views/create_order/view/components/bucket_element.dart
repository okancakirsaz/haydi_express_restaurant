part of '../create_order_view.dart';

class BucketElement extends StatelessWidget {
  final CreateOrderViewModel viewModel;
  final int index;
  final BucketElementModel data;
  const BucketElement(
      {super.key,
      required this.index,
      required this.data,
      required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 45,
        child: ListTile(
          minVerticalPadding: 0,
          title: Text(
            "${data.menuElement.name} x${data.count}",
            style: TextConsts.instance.regularBlack12Bold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: _buildTrailing(),
        ),
      ),
    );
  }

  Widget _buildTrailing() {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildPrice(),
          IconButton(
            onPressed: () => viewModel.deleteSelectedItem(index),
            icon: Icon(
              Icons.delete,
              color: ColorConsts.instance.primary,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    if (data.menuElement.isOnDiscount) {
      return SizedBox(
        width: 70,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${data.menuElement.price * data.count}₺",
                  style: TextConsts.instance.regularPrimary12LineThrough,
                ),
                Text(
                  "${viewModel.getSelectedElementPrice(index)}₺",
                  style: TextConsts.instance.regularBlack12,
                ),
              ],
            ),
            DiscountContainer(
              margin: PaddingConsts.instance.left5,
              discountAmount: data.menuElement.discountAmount!,
            ),
          ],
        ),
      );
    } else {
      return Text(
        "${viewModel.getSelectedElementPrice(index)}₺",
        style: TextConsts.instance.regularBlack12Bold,
      );
    }
  }
}
