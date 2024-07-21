import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/constants/text_consts.dart';
import 'package:haydi_ekspres_dev_tools/models/chat_room_model.dart';
import 'package:haydi_ekspres_dev_tools/models/restaurant_model.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:haydi_express_restaurant/views/menu_view/view/menu_view.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';

import '../../../core/consts/app_consts.dart';
import '../../../core/managers/web_socket_manager.dart';
import '../../../core/widgets/button/custom_button.dart';
import '../../chat/view/chat_view.dart';
import '../../chat/viewmodel/chat_viewmodel.dart';

part 'main_viewmodel.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() {
    AppConst.restaurantName = RestaurantModel.fromJson(
            localeManager.getJsonData(LocaleKeysEnums.restaurantData.name))
        .businessName;
    _subscribeForNewMessages();
  }

  @observable
  Widget page = const MenuView();

  @action
  changePage(Widget newPage) {
    page = newPage;
  }

  //For getting new messages
  _subscribeForNewMessages() {
    WebSocketManager.instance.webSocketReceiver(
      "New Chat:${localeManager.getStringData(LocaleKeysEnums.id.name)}",
      (e) async {
        final ChatViewModel chatVm = ChatViewModel();
        chatVm.initActiveChats();
        chatVm.activeChats.add(ChatRoomModel.fromJson(e));
        await localeManager.setJsonData(
            LocaleKeysEnums.activeConversations.name,
            chatVm.activeChats.map((e) => e.toJson()).toList());
        _showGoNewMessageDialog(ChatRoomModel.fromJson(e));
      },
    );
  }

  _showGoNewMessageDialog(ChatRoomModel data) {
    showDialog(
        context: viewModelContext,
        builder: (context) => AlertDialog(
              title: Text(
                "Yeni bir mesajınız var!",
                style: TextConsts.instance.regularBlack16,
              ),
              content: CustomButton(
                onPressed: () => navigationManager.navigate(
                  ChatView(
                    isContactingWithCustomer: true,
                    targetId: data.helperId,
                    targetName: data.helperName,
                  ),
                ),
                text: "Mesaja git",
              ),
            ));
  }
}
