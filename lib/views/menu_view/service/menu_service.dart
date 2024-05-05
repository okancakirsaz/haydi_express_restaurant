import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:haydi_express_restaurant/core/consts/endpoints.dart';
import 'package:haydi_express_restaurant/views/menu_view/models/add_campaign_model.dart';

import '../../../../core/managers/network_manager.dart';
import '../models/menu_model.dart';

final class MenuService extends NetworkManager {
  Future<MenuModel?> createMenu(MenuModel data, Uint8List file) async {
    try {
      final response = await network.post(Endpoints.instance.createMenu,
          data: FormData.fromMap({
            "file": uploadFile(file, data.menuId),
            "json": jsonEncode(data.toJson()),
          }));
      return MenuModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<List<MenuModel>?> getRestaurantMenu(String id) async {
    try {
      print(id);
      final response = await network.get(
        Endpoints.instance.getRestaurantMenu,
        queryParameters: {"id": id},
      );
      List<MenuModel> dataList = [];
      for (int i = 0; i <= response.data.length - 1; i++) {
        dataList.add(MenuModel.fromJson(response.data[i]));
      }

      return dataList;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> cancelCampaign(String menuId) async {
    try {
      final response = await network.get(
        Endpoints.instance.cancelCampaign,
        queryParameters: {"menuId": menuId},
      );
      return bool.parse(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<AddCampaignModel?> addDiscount(AddCampaignModel data) async {
    try {
      final response = await network.post(
        Endpoints.instance.addDiscount,
        data: data.toJson(),
      );
      return AddCampaignModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
