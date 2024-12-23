part of '../orders_view.dart';

class OrderWidget extends StatelessWidget {
  final OrdersViewModel viewModel;
  final OrderModel data;
  final int index;
  final bool isOrderExpired;
  const OrderWidget(
      {super.key,
      required this.viewModel,
      required this.data,
      required this.isOrderExpired,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isOrderExpired
        ? const Color(0xFFFFB000)
        : ColorConsts.instance.blurGrey;
    return ExpansionTile(
      collapsedBackgroundColor: bgColor,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusConsts.instance.circularAll10,
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: RadiusConsts.instance.circularAll10,
      ),
      tilePadding: PaddingConsts.instance.all5,
      childrenPadding: PaddingConsts.instance.all10,
      leading: _buildLeading(),
      title: _buildTrailing(),
      children: _buildChildren(context),
    );
  }

  Widget _buildLeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.customerName,
          style: TextConsts.instance.regularThird14Bold,
          overflow: TextOverflow.ellipsis,
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            style: TextConsts.instance.regularBlack10,
            text: viewModel
                .parseIso8601DateFormatDetailed(data.orderCreationDate),
            children: <TextSpan>[
              TextSpan(
                text: "\n${data.customerPhoneNumber}",
                style: TextConsts.instance.regularThird12,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrailing() {
    final bool isOrderWaitingAccept =
        data.orderState.asOrderState == WaitingRestaurantAccept.instance
            ? true
            : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CustomStateFullButton(
          width: 150,
          onPressed: () async => isOrderExpired
              ? null
              : viewModel.fetchNewOrderStateToDb(data, index),
          text: isOrderWaitingAccept ? "Onayla" : data.orderState,
          style: isOrderWaitingAccept
              ? TextConsts.instance.regularBlack16
              : TextConsts.instance.regularWhite12,
          backgroundColor: data.orderState.asOrderState.color,
        ),
        FloatingActionButton(
          backgroundColor: ColorConsts.instance.background,
          //TODO:Add print process
          onPressed: () {},
          mini: true,
          child: const Icon(
            Icons.print_outlined,
            color: Colors.black,
            size: 25,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return <Widget>[
      Column(
        children: _buildOrderedMenus(context),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: SvgPicture.asset(
          AssetConsts.instance.addition,
          height: 9,
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: PaddingConsts.instance.right10,
          child: Padding(
            padding: PaddingConsts.instance.top5,
            child: Text(
              "${data.paymentData.totalPrice}₺",
              style: TextConsts.instance.regularBlack14,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: PaddingConsts.instance.all5,
          child: Text(
            data.paymentMethod,
            style: TextConsts.instance.regularBlack10,
          ),
        ),
      ),
      _buildOrderNote(),
      Padding(
        padding: PaddingConsts.instance.top10,
        child: _buildAddressLine(),
      ),
      Padding(
        padding: PaddingConsts.instance.top10,
        child: isOrderExpired ? null : _buildContactButtons(),
      ),
    ];
  }

  Widget _buildOrderNote() {
    return data.note!.isNotEmpty
        ? Align(
            alignment: Alignment.bottomLeft,
            child: RichText(
              text: TextSpan(
                style: TextConsts.instance.regularThird16Bold,
                text: "Sipariş Notu:",
                children: <TextSpan>[
                  TextSpan(
                    text: data.note,
                    style: TextConsts.instance.regularThird16,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildAddressLine() {
    final AddressModel address = data.addressData;
    return Text(
      "${address.street}, ${address.neighborhood}, Bina No: ${address.buildingNumber}, Kapı No: ${address.doorNumber}, Kat: ${address.floor} - ${address.city}/${address.state}\n${address.addressDirection}",
      textAlign: TextAlign.left,
      style: TextConsts.instance.regularThird14,
    );
  }

  List<Widget> _buildOrderedMenus(BuildContext context) {
    return data.menuData.map((e) => _buildMenuElement(context, e)).toList();
  }

  Widget _buildMenuElement(
      BuildContext context, BucketElementModel bucketElement) {
    return Container(
      margin: PaddingConsts.instance.horizontal10,
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: RichText(
          text: TextSpan(
            style: TextConsts.instance.regularThird16Bold,
            text: bucketElement.menuElement.name,
            children: <TextSpan>[
              TextSpan(
                text: " x${bucketElement.count}",
                style: TextConsts.instance.regularBlack16,
              ),
            ],
          ),
        ),
        trailing: Text(
          viewModel.fetchMenuPrice(bucketElement),
          style: TextConsts.instance.regularThird16Bold,
        ),
      ),
    );
  }

  Widget _buildContactButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildSpecialButton(
          AssetConsts.instance.customer,
          "Müşteri ile\niletişime geç",
          () => viewModel.showChatDialog(data),
        ),
        //TODO:Add contact process
        viewModel.isRestaurantPreferredHe
            ? _buildSpecialButton(
                AssetConsts.instance.haydiCourier,
                "Kurye ile\niletişime geç",
                () {},
              )
            : const SizedBox(),
        _buildSpecialButton(
          AssetConsts.instance.cancel,
          "Siparişi iptal et",
          () => viewModel.openOrderCancelDialog(viewModel, data),
          size: 15,
        ),
      ],
    );
  }

  Widget _buildSpecialButton(
      String iconPath, String text, VoidCallback onPressed,
      {double? size}) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        shadowColor: ColorConsts.instance.blurGrey,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: RadiusConsts.instance.circularAll10,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Padding(
            padding: PaddingConsts.instance.horizontal10,
            child: SvgPicture.asset(
              iconPath,
              width: size ?? 25,
              height: size ?? 25,
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.right10,
            child: Text(
              text,
              style: TextConsts.instance.regularBlack10,
            ),
          ),
        ],
      ),
    );
  }
}
