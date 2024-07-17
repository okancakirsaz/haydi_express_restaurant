final class Endpoints {
  static final Endpoints instance = Endpoints();

  //Auth
  final String logIn = "/auth/log-in-restaurant";
  final String forgotPassword = "/auth/forgot-password-restaurant";
  final String mailVerificationRequest = "/auth/mail-verification-request";
  final String mailVerification = "/auth/mail-verification";
  final String signUp = "/auth/sign-up-restaurant";

  //Menu
  final String createMenu = "/menu/create-menu";
  final String editMenu = "/menu/edit-menu";
  final String getRestaurantMenu = "/menu/get-restaurant-menu";
  final String cancelCampaign = "/menu/cancel-campaign";
  final String addDiscount = "/menu/add-discount";
  final String deleteMenu = "/menu/delete-menu";

  //Advertisement
  final String getBoost = "/advertisement/get-new-advertisement";

  //Search
  final String getSearchAds = "/search/get-search-ads";

  //Orders
  final String getActiveOrders = "/order/restaurant-active-orders";
  final String getOrderLogs = "/order/restaurant-order-logs";
  final String updateOrderState = "/order/update-order-state";
  final String cancelOrder = "/order/cancel-order";
  final String createOrder = "/order/create-order";
}
