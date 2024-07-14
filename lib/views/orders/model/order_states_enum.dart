import 'package:flutter/material.dart';

//TODO: Optimize it
enum OrderStates {
  waitingForRestaurantAccept,
  waitingForCourierAttachment,
  waitingForAcceptFromCourier,
  courierIsOnWay,
  packageIsOnWay,
  packageDelivered,
  packageCancelled,
  stateError,
}

extension OrderStatesInUi on OrderStates {
  String get value {
    switch (this) {
      case OrderStates.waitingForRestaurantAccept:
        return 'Restoran Onayı Bekleniyor';
      case OrderStates.waitingForCourierAttachment:
        return 'Kurye Ataması Bekleniyor';
      case OrderStates.waitingForAcceptFromCourier:
        return 'Kuryeden Onay Bekleniyor';
      case OrderStates.courierIsOnWay:
        return 'Kurye Yolda';
      case OrderStates.packageIsOnWay:
        return 'Paket Yolda';
      case OrderStates.packageDelivered:
        return 'Teslim Edildi';
      case OrderStates.packageCancelled:
        return 'İptal Edildi';
      default:
        return 'Hata';
    }
  }

  OrderStates getEnumFromValue(String state) {
    switch (state) {
      case 'Restoran Onayı Bekleniyor':
        return OrderStates.waitingForRestaurantAccept;
      case 'Kurye Ataması Bekleniyor':
        return OrderStates.waitingForCourierAttachment;
      case 'Kuryeden Onay Bekleniyor':
        return OrderStates.waitingForAcceptFromCourier;
      case 'Kurye Yolda':
        return OrderStates.courierIsOnWay;
      case 'Paket Yolda':
        return OrderStates.packageIsOnWay;
      case 'Teslim Edildi':
        return OrderStates.packageDelivered;
      case 'İptal Edildi':
        return OrderStates.packageCancelled;
      default:
        return OrderStates.stateError;
    }
  }

  Color get color {
    switch (this) {
      case OrderStates.waitingForRestaurantAccept:
        return Colors.white;
      case OrderStates.waitingForCourierAttachment:
        return const Color(0xFFD04A20);
      case OrderStates.waitingForAcceptFromCourier:
        return const Color(0xFFCD8F18);
      case OrderStates.courierIsOnWay:
        return const Color(0xFF6ABD29);
      case OrderStates.packageIsOnWay:
        return const Color(0xFF166283);
      case OrderStates.packageDelivered:
        return const Color(0xFF401F71);
      case OrderStates.packageCancelled:
        return const Color(0xFFD72036);
      default:
        return Colors.white;
    }
  }
}
