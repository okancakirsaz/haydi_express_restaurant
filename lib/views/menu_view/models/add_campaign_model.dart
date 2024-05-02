class AddCampaignModel {
  int amount;
  String expireDate;
  String menuId;

  AddCampaignModel({
    required this.amount,
    required this.expireDate,
    required this.menuId,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'expireDate': expireDate,
      'menuId': menuId,
    };
  }

  factory AddCampaignModel.fromJson(Map<String, dynamic> json) {
    return AddCampaignModel(
      amount: json['amount'] as int,
      expireDate: json['expireDate'] as String,
      menuId: json['menuId'] as String,
    );
  }

  @override
  String toString() =>
      "AddCampaignModel(amount: $amount,expireDate: $expireDate,menuId: $menuId)";

  @override
  int get hashCode => Object.hash(amount, expireDate, menuId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddCampaignModel &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          expireDate == other.expireDate &&
          menuId == other.menuId;
}
