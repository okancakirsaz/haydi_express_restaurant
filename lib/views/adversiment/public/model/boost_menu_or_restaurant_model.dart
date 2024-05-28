class BoostRestaurantOrMenuModel {
  String expireDate;
  String elementId;
  bool isRestaurant;
  String restaurantId;
  String boostArea;

  BoostRestaurantOrMenuModel({
    required this.expireDate,
    required this.elementId,
    required this.isRestaurant,
    required this.restaurantId,
    required this.boostArea,
  });

  Map<String, dynamic> toJson() {
    return {
      'expireDate': expireDate,
      'elementId': elementId,
      'isRestaurant': isRestaurant,
      'restaurantId': restaurantId,
      'boostArea': boostArea,
    };
  }

  factory BoostRestaurantOrMenuModel.fromJson(Map<String, dynamic> json) {
    return BoostRestaurantOrMenuModel(
      expireDate: json['expireDate'] as String,
      elementId: json['elementId'] as String,
      isRestaurant: json['isRestaurant'] as bool,
      restaurantId: json['restaurantId'] as String,
      boostArea: json['boostArea'] as String,
    );
  }

  @override
  String toString() =>
      "BoostRestaurantOrMenuModel(expireDate: $expireDate,elementId: $elementId,isRestaurant: $isRestaurant,restaurantId: $restaurantId,boostArea: $boostArea)";

  @override
  int get hashCode =>
      Object.hash(expireDate, elementId, isRestaurant, restaurantId, boostArea);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoostRestaurantOrMenuModel &&
          runtimeType == other.runtimeType &&
          expireDate == other.expireDate &&
          elementId == other.elementId &&
          isRestaurant == other.isRestaurant &&
          restaurantId == other.restaurantId &&
          boostArea == other.boostArea;
}
