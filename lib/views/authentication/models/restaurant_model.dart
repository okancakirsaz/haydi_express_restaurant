class RestaurantModel {
  String ownerName;
  String ownerSurname;
  String phoneNumber;
  String businessName;
  String email;
  String password;
  String taxNumber;
  bool isMailVerified;
  String address;
  bool wantDeliveryFromUs;
  String ibanNumber;
  String bankName;
  String bankAccountOwner;
  String cardNumber;
  String cardOwner;
  String cardCvv;
  String cardExpirationDate;
  bool isPoliciesAccepted;
  String uid;

  RestaurantModel({
    required this.ownerName,
    required this.ownerSurname,
    required this.phoneNumber,
    required this.businessName,
    required this.email,
    required this.password,
    required this.taxNumber,
    required this.isMailVerified,
    required this.address,
    required this.wantDeliveryFromUs,
    required this.ibanNumber,
    required this.bankName,
    required this.bankAccountOwner,
    required this.cardNumber,
    required this.cardOwner,
    required this.cardCvv,
    required this.cardExpirationDate,
    required this.isPoliciesAccepted,
    required this.uid,
  });

  RestaurantModel copyWith({
    String? ownerName,
    String? ownerSurname,
    String? phoneNumber,
    String? businessName,
    String? email,
    String? password,
    String? taxNumber,
    bool? isMailVerified,
    String? address,
    bool? wantDeliveryFromUs,
    String? ibanNumber,
    String? bankName,
    String? bankAccountOwner,
    String? cardNumber,
    String? cardOwner,
    String? cardCvv,
    String? cardExpirationDate,
    bool? isPoliciesAccepted,
    String? uid,
  }) {
    return RestaurantModel(
      ownerName: ownerName ?? this.ownerName,
      ownerSurname: ownerSurname ?? this.ownerSurname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      businessName: businessName ?? this.businessName,
      email: email ?? this.email,
      password: password ?? this.password,
      taxNumber: taxNumber ?? this.taxNumber,
      isMailVerified: isMailVerified ?? this.isMailVerified,
      address: address ?? this.address,
      wantDeliveryFromUs: wantDeliveryFromUs ?? this.wantDeliveryFromUs,
      ibanNumber: ibanNumber ?? this.ibanNumber,
      bankName: bankName ?? this.bankName,
      bankAccountOwner: bankAccountOwner ?? this.bankAccountOwner,
      cardNumber: cardNumber ?? this.cardNumber,
      cardOwner: cardOwner ?? this.cardOwner,
      cardCvv: cardCvv ?? this.cardCvv,
      cardExpirationDate: cardExpirationDate ?? this.cardExpirationDate,
      isPoliciesAccepted: isPoliciesAccepted ?? this.isPoliciesAccepted,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerName': ownerName,
      'ownerSurname': ownerSurname,
      'phoneNumber': phoneNumber,
      'businessName': businessName,
      'email': email,
      'password': password,
      'taxNumber': taxNumber,
      'isMailVerified': isMailVerified,
      'address': address,
      'wantDeliveryFromUs': wantDeliveryFromUs,
      'ibanNumber': ibanNumber,
      'bankName': bankName,
      'bankAccountOwner': bankAccountOwner,
      'cardNumber': cardNumber,
      'cardOwner': cardOwner,
      'cardCvv': cardCvv,
      'cardExpirationDate': cardExpirationDate,
      'isPoliciesAccepted': isPoliciesAccepted,
      'uid': uid,
    };
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      ownerName: json['ownerName'] as String,
      ownerSurname: json['ownerSurname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      businessName: json['businessName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      taxNumber: json['taxNumber'] as String,
      isMailVerified: json['isMailVerified'] as bool,
      address: json['address'] as String,
      wantDeliveryFromUs: json['wantDeliveryFromUs'] as bool,
      ibanNumber: json['ibanNumber'] as String,
      bankName: json['bankName'] as String,
      bankAccountOwner: json['bankAccountOwner'] as String,
      cardNumber: json['cardNumber'] as String,
      cardOwner: json['cardOwner'] as String,
      cardCvv: json['cardCvv'] as String,
      cardExpirationDate: json['cardExpirationDate'] as String,
      isPoliciesAccepted: json['isPoliciesAccepted'] as bool,
      uid: json['uid'] as String,
    );
  }

  @override
  String toString() =>
      "RestaurantModel(ownerName: $ownerName,ownerSurname: $ownerSurname,phoneNumber: $phoneNumber,businessName: $businessName,email: $email,password: $password,taxNumber: $taxNumber,isMailVerified: $isMailVerified,address: $address,wantDeliveryFromUs: $wantDeliveryFromUs,ibanNumber: $ibanNumber,bankName: $bankName,bankAccountOwner: $bankAccountOwner,cardNumber: $cardNumber,cardOwner: $cardOwner,cardCvv: $cardCvv,cardExpirationDate: $cardExpirationDate,isPoliciesAccepted: $isPoliciesAccepted,uid: $uid)";

  @override
  int get hashCode => Object.hash(
      ownerName,
      ownerSurname,
      phoneNumber,
      businessName,
      email,
      password,
      taxNumber,
      isMailVerified,
      address,
      wantDeliveryFromUs,
      ibanNumber,
      bankName,
      bankAccountOwner,
      cardNumber,
      cardOwner,
      cardCvv,
      cardExpirationDate,
      isPoliciesAccepted,
      uid);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModel &&
          runtimeType == other.runtimeType &&
          ownerName == other.ownerName &&
          ownerSurname == other.ownerSurname &&
          phoneNumber == other.phoneNumber &&
          businessName == other.businessName &&
          email == other.email &&
          password == other.password &&
          taxNumber == other.taxNumber &&
          isMailVerified == other.isMailVerified &&
          address == other.address &&
          wantDeliveryFromUs == other.wantDeliveryFromUs &&
          ibanNumber == other.ibanNumber &&
          bankName == other.bankName &&
          bankAccountOwner == other.bankAccountOwner &&
          cardNumber == other.cardNumber &&
          cardOwner == other.cardOwner &&
          cardCvv == other.cardCvv &&
          cardExpirationDate == other.cardExpirationDate &&
          isPoliciesAccepted == other.isPoliciesAccepted &&
          uid == other.uid;
}
