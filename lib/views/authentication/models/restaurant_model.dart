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
  String accountCreationDate;
  bool isPoliciesAccepted;
  String uid;
  String? nextPaymentDate;
  bool isAccountBanned;

  RestaurantModel({
    required this.ownerName,
    required this.ownerSurname,
    required this.phoneNumber,
    required this.businessName,
    required this.email,
    required this.accountCreationDate,
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
    this.nextPaymentDate,
    required this.isAccountBanned,
  });

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
      'accountCreationDate': accountCreationDate,
      'cardExpirationDate': cardExpirationDate,
      'isPoliciesAccepted': isPoliciesAccepted,
      'uid': uid,
      'nextPaymentDate': nextPaymentDate,
      'isAccountBanned': isAccountBanned,
    };
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      accountCreationDate: json['accountCreationDate'] as String,
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
      nextPaymentDate: json['nextPaymentDate'] as String?,
      isAccountBanned: json['isAccountBanned'] as bool,
    );
  }

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
