class BoostMenuModel {
  String expireDate;
  String menuId;
  String boostArea;

  BoostMenuModel({
    required this.expireDate,
    required this.menuId,
    required this.boostArea,
  });

  Map<String, dynamic> toJson() {
    return {
      'expireDate': expireDate,
      'menuId': menuId,
      'boostArea': boostArea,
    };
  }

  factory BoostMenuModel.fromJson(Map<String, dynamic> json) {
    return BoostMenuModel(
      expireDate: json['expireDate'] as String,
      menuId: json['menuId'] as String,
      boostArea: json['boostArea'] as String,
    );
  }

  @override
  String toString() =>
      "BoostMenuModel(expireDate: $expireDate,menuId: $menuId,boostArea: $boostArea)";

  @override
  int get hashCode => Object.hash(expireDate, menuId, boostArea);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoostMenuModel &&
          runtimeType == other.runtimeType &&
          expireDate == other.expireDate &&
          menuId == other.menuId &&
          boostArea == other.boostArea;
}
