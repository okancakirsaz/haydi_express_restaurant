part of '../stats_view.dart';

class Billings extends StatelessWidget {
  final StatsViewModel viewModel;
  const Billings({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return viewModel.isRestaurantCreationOverSixMonths
        ? Column(
            children: <Widget>[
              Text(
                viewModel.fetchPaymentDateText,
                style: TextConsts.instance.regularBlack16,
              ),
              StatContainer(
                desc: "Toplam\nKomisyon",
                value: "${viewModel.restaurantData.bills}₺",
              )
            ],
          )
        : Text(
            "İlk altı ay boyunca işletmelerden komisyon talep edilmemektedir.",
            style: TextConsts.instance.regularPrimary16Bold,
          );
  }
}
