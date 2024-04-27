import 'package:flutter/material.dart';
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
  final TextEditingController taxNumber = TextEditingController();
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

  @action
  setInitialPage(SignUpViewModel viewModel) {
    page = RestaurantOwnerInputs(viewModel: viewModel);
  }

  @action
  goToPage(Widget nextPage, String newTitle, int index, bool isNext) {
    title = newTitle;
    page = nextPage;
    changeProcessBarStatus(index, isNext);
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

  pickCourierOption(bool option, SignUpViewModel viewModel) {
    isWantCourierService = option;
    goToPage(BankInformation(viewModel: viewModel), titles[5], 5, true);
  }

  disposeAllControllers() {
    ownerName.dispose();
    ownerSurName.dispose();
    ownerPhoneNumber.dispose();
    restaurantName.dispose();
    email.dispose();
    password.dispose();
    taxNumber.dispose();
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
}
