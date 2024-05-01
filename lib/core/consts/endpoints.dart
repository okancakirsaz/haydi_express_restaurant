final class Endpoints {
  static final Endpoints instance = Endpoints();

  //Auth
  final String logIn = "/auth/log-in-restaurant";
  final String forgotPassword = "/auth/forgot-password";
  final String mailVerificationRequest = "/auth/mail-verification-request";
  final String mailVerification = "/auth/mail-verification";
  final String signUp = "/auth/sign-up-restaurant";

  //Menu
  final String createMenu = "/menu/create-menu";
  final String getRestaurantMenu = "/menu/get-restaurant-menu";
}
