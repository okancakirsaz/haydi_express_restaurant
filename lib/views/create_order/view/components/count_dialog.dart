part of '../create_order_view.dart';

class CountDialog extends StatelessWidget {
  final MenuModel data;
  final CreateOrderViewModel viewModel;
  const CountDialog({super.key, required this.data, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConsts.instance.third,
      title: Center(
        child: Text(
          "Adet Seçiniz",
          style: TextConsts.instance.regularWhite20Bold,
        ),
      ),
      content: SizedBox(
        height: 120,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton(false),
                Padding(
                  padding: PaddingConsts.instance.horizontal30,
                  child: Observer(builder: (context) {
                    return Text(
                      "${viewModel.selectedMenuItemCount}",
                      style: TextConsts.instance.regularWhite20Bold,
                    );
                  }),
                ),
                _buildButton(true),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: PaddingConsts.instance.all20,
                  child: CustomButton(
                    onPressed: () => viewModel.navigatorPop(),
                    text: "İptal Et",
                    style: TextConsts.instance.regularWhite14,
                  ),
                ),
                CustomButton(
                  onPressed: () => viewModel.addSelectedItems(data),
                  text: "Onayla",
                  style: TextConsts.instance.regularWhite14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(bool isIncrement) {
    return FloatingActionButton(
      onPressed: () => viewModel.changeCount(isIncrement),
      mini: true,
      backgroundColor: ColorConsts.instance.lightThird,
      child: Icon(
        isIncrement ? Icons.add : Icons.remove,
        size: 20,
        color: ColorConsts.instance.background,
      ),
    );
  }
}
