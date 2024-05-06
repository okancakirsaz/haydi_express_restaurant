part of '../profile_view.dart';

class AccountInformation extends StatelessWidget {
  final ProfileViewModel viewModel;
  const AccountInformation({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const PartTitle(
          title: "Hesap Bilgileri",
          subtitle: "Profil",
        ),
        _buildContent(
          "Hesap açılış tarihi",
          viewModel.parseIso8601DateFormat(
              viewModel.restaurantData.accountCreationDate),
        ),
        _buildContent(
          "Mail adresi onay durumu",
          viewModel.restaurantData.isMailVerified ? "Onaylandı" : "Onaylanmadı",
        ),
        _buildContent(
          "Mail adresi",
          viewModel.restaurantData.email,
        ),
        _buildContent(
          "Sonraki ödeme tarihi",
          viewModel.restaurantData.nextPaymentDate == null
              ? "Sonraki ödeme tarihi belirlenmemiş."
              : viewModel.parseIso8601DateFormat(
                  viewModel.restaurantData.nextPaymentDate!),
        ),
        _buildContent(
          "Kurye hizmeti",
          viewModel.restaurantData.wantDeliveryFromUs
              ? "Haydi Express"
              : "Verilmiyor",
        ),
        _buildContent("Hesap Durumu",
            viewModel.restaurantData.isAccountBanned ? "Askıda" : "Açık"),
        _buildContent("Telefon Numarası", viewModel.restaurantData.phoneNumber),
      ],
    );
  }

  Widget _buildContent(String key, String value) {
    return Padding(
      padding: PaddingConsts.instance.all10,
      child: Row(
        children: <Widget>[
          Text(
            "$key: ",
            style: TextConsts.instance.regularThird16Bold,
          ),
          Text(
            value,
            style: TextConsts.instance.regularBlack16,
          )
        ],
      ),
    );
  }
}
