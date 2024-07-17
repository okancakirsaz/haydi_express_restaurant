part of '../create_order_view.dart';

class CreateOrderTitleElement extends StatelessWidget {
  final String text;
  const CreateOrderTitleElement({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextConsts.instance.regularPrimary18Bold,
    );
  }
}
