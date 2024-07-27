import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/models/models_index.dart';
import 'package:haydi_ekspres_dev_tools/models/work_hours_model.dart';
import 'package:haydi_express_restaurant/views/authentication/log_in/viewmodel/log_in_viewmodel.dart';
import 'package:haydi_express_restaurant/views/authentication/sign_up/service/sign_up_service.dart';
import 'package:haydi_express_restaurant/views/authentication/sign_up/view/sign_up_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {}

  final SignUpService service = SignUpService();

  List<String> titles = [
    "Restoran Sahibinin Bilgilerini Giriniz",
    "Restoran Bilgilerini Giriniz",
    "Mail Adresinize Gelen Kodu Giriniz",
    "Restoran Konumunu Giriniz",
    "Kurye Seçimi",
    "Banka Bilgilerinizi Giriniz",
    "Gizlilik Politikası Ve Kullanıcı Sözleşmesi",
    ""
  ];

  @observable
  String title = "Restoran Sahibinin Bilgilerini Giriniz";

  @observable
  Widget page = Container();

  @observable
  double process = 50;

  final TextEditingController ownerName = TextEditingController();
  final TextEditingController ownerSurName = TextEditingController();
  final TextEditingController ownerPhoneNumber = TextEditingController();
  final TextEditingController restaurantName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mailVerification = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController addressLineOne = TextEditingController();
  final TextEditingController addressLineTwo = TextEditingController();
  final TextEditingController iban = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController bankAccountOwner = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController cardOwner = TextEditingController();
  final TextEditingController cvv = TextEditingController();
  final TextEditingController cardExpireDate = TextEditingController();
  bool isWantCourierService = false;
  bool isMailVerified = false;

  @action
  setInitialPage(SignUpViewModel viewModel) {
    page = RestaurantOwnerInputs(viewModel: viewModel);
  }

  @action
  goToPage(Widget nextPage, String newTitle, int index, bool isNext,
      [bool? validation]) {
    if (validation ?? true) {
      title = newTitle;
      page = nextPage;
      changeProcessBarStatus(index, isNext);
    } else {
      showErrorDialog("Lütfen istenilen bilgilerin girildiğinden emin olun.");
    }
  }

  @action
  changeProcessBarStatus(int index, bool isNext) {
    //Without thanks page
    int pagesLength = titles.length - 1;
    double maxProcessLength = 840;
    double oneProcess = maxProcessLength / pagesLength;
    if (isNext) {
      process = process + oneProcess;
    } else {
      process = process - oneProcess;
    }
  }

  disposeAllControllers() {
    ownerName.dispose();
    ownerSurName.dispose();
    ownerPhoneNumber.dispose();
    restaurantName.dispose();
    email.dispose();
    password.dispose();
    mailVerification.dispose();
    city.dispose();
    addressLineOne.dispose();
    addressLineTwo.dispose();
    iban.dispose();
    bankName.dispose();
    bankAccountOwner.dispose();
    cardNumber.dispose();
    cardOwner.dispose();
    cvv.dispose();
    cardExpireDate.dispose();
  }

  Future<void> sendMailVerifyRequest(SignUpViewModel viewModel) async {
    switch (restaurantInputsValidation) {
      case true:
        //For entered new mail address case
        isMailVerified = false;
        final MailVerificationRequestModel? response =
            await service.sendVerifyRequest(
          MailVerificationRequestModel(
              email: email.text, isMailSent: false, verificationCode: null),
        );
        _handleMailVerifyResponse(response, viewModel);
        break;
      default:
        showErrorDialog("Lütfen istenilen bilgilerin girildiğinden emin olun.");
    }
  }

  _handleMailVerifyResponse(
      MailVerificationRequestModel? response, SignUpViewModel viewModel) {
    if (response != null) {
      if (response.isMailSent) {
        goToPage(
          MailCodeView(
            viewModel: viewModel,
          ),
          titles[2],
          2,
          true,
        );
      } else {
        showErrorDialog();
      }
    } else {
      showErrorDialog();
    }
  }

  Future<void> sendVerifyCode(SignUpViewModel viewModel) async {
    if (!isMailVerified) {
      final MailVerificationModel? response = await service.verifyMailCode(
        MailVerificationModel(
            email: email.text,
            isCodeTrue: false,
            verificationCode: mailVerification.text),
      );
      _handleSendVerifyCodeResponse(response, viewModel);
    } else {
      _goToAddressInputs(viewModel);
    }
  }

  _handleSendVerifyCodeResponse(
      MailVerificationModel? response, SignUpViewModel viewModel) {
    if (response != null) {
      if (response.isCodeTrue || kDebugMode) {
        _goToAddressInputs(viewModel);
        isMailVerified = true;
      } else {
        showErrorDialog("Girilen kod yanlış tekrar deneyiniz.");
      }
    } else {
      showErrorDialog();
    }
  }

  _goToAddressInputs(SignUpViewModel viewModel) {
    goToPage(
      AddressInputs(
        viewModel: viewModel,
      ),
      titles[3],
      3,
      true,
    );
  }

  pickCourierOption(bool option, SignUpViewModel viewModel) {
    isWantCourierService = option;
    goToPage(BankInformation(viewModel: viewModel), titles[5], 5, true);
  }

  goToCourierOptionPage(SignUpViewModel viewModel) {
    goToPage(CourierOptions(viewModel: viewModel), titles[4], 4, true,
        addressInputsValidation);
  }

  goToPrivacyPolicy(SignUpViewModel viewModel) {
    goToPage(
      PrivacyPolicy(viewModel: viewModel),
      titles[5],
      5,
      true,
      bankAccountValidation,
    );
  }

  goToFinalPage(SignUpViewModel viewModel) {
    goToPage(
      ThanksView(viewModel: viewModel),
      titles[7],
      7,
      true,
    );
  }

  bool get ownerInputsValidation {
    if (ownerName.text != "" &&
        ownerSurName.text != "" &&
        ownerPhoneNumber.text != "" &&
        ownerPhoneNumber.text.length == 10) {
      return true;
    } else {
      return false;
    }
  }

  bool get restaurantInputsValidation {
    if (restaurantName.text != "" &&
        email.text != "" &&
        password.text != "" &&
        email.text.contains("@")) {
      return true;
    } else {
      return false;
    }
  }

  bool get addressInputsValidation {
    if (addressLineOne.text != "" && addressLineTwo.text != "") {
      return true;
    } else {
      return false;
    }
  }

  bool get bankAccountValidation {
    if (iban.text != "" &&
        iban.text.length == 20 &&
        bankName.text != "" &&
        bankAccountOwner.text != "" &&
        cardNumber.text != "" &&
        cardNumber.text.length == 16 &&
        cardOwner.text != "" &&
        cvv.text != "" &&
        cvv.text.length >= 3 &&
        cardExpireDate.text != "" &&
        cardExpireDate.text.length == 5) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> tryToSingUp() async {
    final dynamic response = await service.signUp(_fetchSignUpData);
    if (response != null) {
      if (response is HttpExceptionModel) {
        showErrorDialog(response.message);
        navigatorPop();
      } else {
        await _tryToLogIn();
      }
    } else {
      showErrorDialog();
    }
  }

  Future<void> _tryToLogIn() async {
    //Dependency Injection
    final LogInViewModel loginViewModel = LogInViewModel();
    loginViewModel.setContext(viewModelContext);
    await loginViewModel.tryToLogIn(email.text, password.text);
  }

  RestaurantModel get _fetchSignUpData {
    return RestaurantModel(
      ownerName: ownerName.text,
      ownerSurname: ownerSurName.text,
      phoneNumber: "+90${ownerPhoneNumber.text}",
      businessName: restaurantName.text,
      email: email.text,
      password: password.text,
      workHours: WorkHoursModel(
        startHour: 9,
        startMinute: 30,
        endHour: 18,
        endMinute: 30,
      ),
      taxNumber: "undefined",
      isMailVerified: isMailVerified,
      address: AddressModel(
        name: restaurantName.text,
        city: city.text,
        state: city.text,
        neighborhood: "neighborhood",
        street: "street",
        buildingNumber: "buildingNumber",
        doorNumber: "doorNumber",
        floor: "floor",
        addressDirection: "addressDirection",
        isVerifiedFromCourier: false,
        uid: restaurantName.text,
        addressOwner: restaurantName.text,
      ),
      wantDeliveryFromUs: isWantCourierService,
      ibanNumber: "TR${iban.text}",
      bankName: bankName.text,
      bankAccountOwner: bankAccountOwner.text,
      payment: CardModel(
        cardHolder: cardOwner.text,
        cardNumber: cardNumber.text,
        cvv: cvv.text,
        expireDate: cardExpireDate.text,
      ),
      isPoliciesAccepted: true,
      accountCreationDate: DateTime.now().toIso8601String(),
      uid: "",
      isAccountBanned: false,
    );
  }
}
