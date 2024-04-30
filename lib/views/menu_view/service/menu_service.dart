import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:haydi_express_restaurant/core/consts/endpoints.dart';

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
}
