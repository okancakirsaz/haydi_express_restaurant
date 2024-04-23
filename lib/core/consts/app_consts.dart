class AppConst {
  static final AppConst instance = AppConst();

  //Endpoints
  final String getMenu = "/menu/get-menu";
  final String createMenuElement = "/menu/create-element";
  final String deleteMenuElement = "/menu/delete-element";
  final String updateMenuElement = "/menu/update-element";
  final String deletePost = "/user/delete-post";
  final String deleteProfileImage = "/user/delete-profile-image";
  final String users = "/community/users";
  final String userPosts = "/user/user-posts";
  final String blockUser = "/community/block-user";
  final String unblockUser = "/community/unblock-user";
  final String orders = "/order/orders";
  final String createOrder = "/order/create-order";
  final String deleteOrder = "/order/delete-order";
  final String changeOrderState = "/order/change-order-state";
  final String createEvent = "/games/create-event";
  final String deleteEvent = "/games/delete-event";
  final String startEvent = "/games/start-event";
  final String getActiveEvents = "/games/get-active-events";
}
