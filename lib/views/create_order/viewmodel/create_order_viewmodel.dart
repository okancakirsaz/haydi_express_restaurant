import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haydi_ekspres_dev_tools/models/address_model.dart';
import 'package:haydi_ekspres_dev_tools/models/bucket_element_model.dart';
import 'package:haydi_ekspres_dev_tools/models/http_exception_model.dart';
import 'package:haydi_ekspres_dev_tools/models/menu_model.dart';
import 'package:haydi_ekspres_dev_tools/models/order_model.dart';
import 'package:haydi_ekspres_dev_tools/models/order_states.dart';
import 'package:haydi_ekspres_dev_tools/models/payment_model.dart';
import 'package:haydi_express_restaurant/views/create_order/service/create_order_service.dart';
import 'package:haydi_express_restaurant/views/create_order/view/create_order_view.dart';
import 'package:haydi_express_restaurant/views/menu_view/service/menu_service.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import 'package:mobx/mobx.dart';
import '../../../core/init/cache/local_keys_enums.dart';

part 'create_order_viewmodel.g.dart';

class CreateOrderViewModel = _CreateOrderViewModelBase
    with _$CreateOrderViewModel;

abstract class _CreateOrderViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  init() async {
    await getProvinceJson();
    fetchCityAsDropdownMenuItem();
    fetchStatesAsDropdownMenuItem();
  }

  dispose() {
    city.dispose();
    state.dispose();
    neighborhood.dispose();
    street.dispose();
    outDoorNumber.dispose();
    doorNumber.dispose();
    addressDirection.dispose();
    addressName.dispose();
    floor.dispose();
    paymentMethod.dispose();
    customerName.dispose();
    customerPhoneNumber.dispose();
  }

  List provinceData = [];
  bool isMenuGot = false;

  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController neighborhood = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController outDoorNumber = TextEditingController();
  final TextEditingController doorNumber = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController addressDirection = TextEditingController();
  final TextEditingController addressName = TextEditingController();
  final TextEditingController paymentMethod = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController customerName = TextEditingController();
  final TextEditingController customerPhoneNumber = TextEditingController();

  final CreateOrderService service = CreateOrderService();
  final MenuService menuService = MenuService();

  @observable
  ObservableList<DropdownMenuEntry> cityDropdownItems = ObservableList.of([]);
  @observable
  ObservableList<DropdownMenuEntry> stateDropdownItems = ObservableList.of([]);

  @observable
  ObservableList<MenuModel> menu = ObservableList.of([]);

  @observable
  ObservableList<BucketElementModel> selectedItems = ObservableList.of([]);

  @observable
  int selectedMenuItemCount = 1;

  Future<List> getProvinceJson() async {
    final String jsonFile =
        await rootBundle.loadString('assets/meta/turkey.json');
    provinceData = jsonDecode(jsonFile);
    return provinceData;
  }

  @action
  fetchCityAsDropdownMenuItem() {
    cityDropdownItems = ObservableList.of(provinceData
        .map((e) => DropdownMenuEntry(value: e["city"], label: e["city"]))
        .toList());
  }

  @action
  fetchStatesAsDropdownMenuItem() {
    city.addListener(() {
      for (int i = 0; i <= provinceData.length - 1; i++) {
        if (city.text == provinceData[i]["city"]) {
          List states = provinceData[i]["states"];
          stateDropdownItems = ObservableList.of(states
              .map((e) => DropdownMenuEntry(value: e, label: e))
              .toList());
          break;
        }
      }
    });
  }

  @action
  Future<List<MenuModel>> getRestaurantMenu() async {
    if (!isMenuGot) {
      List<MenuModel>? response = await menuService.getRestaurantMenu(
          localeManager.getStringData(LocaleKeysEnums.id.name));
      if (response == null) {
        showErrorDialog("Menü getirilirken bir sorun oluştu.");
        response = [];
      }
      menu = ObservableList.of(response);
      await localeManager.setJsonData(
          LocaleKeysEnums.menu.name, menu.map((e) => e.toJson()).toList());
      isMenuGot = true;
      return response;
    } else {
      return [];
    }
  }

  @action
  filterMenu(String query) {
    if (query.isNotEmpty) {
      menu = ObservableList.of(
        menu
            .where(
              (e) => e.name.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList(),
      );
    } else {
      menu = ObservableList.of(
        (localeManager.getJsonData(LocaleKeysEnums.menu.name) as List)
            .map(
              (e) => MenuModel.fromJson(e),
            )
            .toList(),
      );
    }
  }

  showCountDialog(MenuModel selectedMenu, CreateOrderViewModel viewModel) {
    showDialog(
      context: viewModelContext,
      builder: (context) =>
          CountDialog(data: selectedMenu, viewModel: viewModel),
    );
  }

  @action
  changeCount(bool isIncrement) {
    if (isIncrement) {
      selectedMenuItemCount++;
    } else {
      if (selectedMenuItemCount >= 2) {
        selectedMenuItemCount--;
      }
    }
  }

  @action
  addSelectedItems(MenuModel data) {
    selectedItems.add(
      BucketElementModel(menuElement: data, count: selectedMenuItemCount),
    );
    navigatorPop();
    selectedMenuItemCount = 1;
  }

  @action
  deleteSelectedItem(int index) {
    selectedItems.removeAt(index);
  }

  int getSelectedElementPrice(int index) {
    return selectedItems[index].menuElement.isOnDiscount
        ? calculateDiscount(
            (selectedItems[index].menuElement.price *
                selectedItems[index].count),
            selectedItems[index].menuElement.discountAmount!)
        : selectedItems[index].menuElement.price * selectedItems[index].count;
  }

  Future<void> createOrder() async {
    if (_validation) {
      final response = await service.createOrder(_fetchOrder, accessToken!);
      if (response == null || response is HttpExceptionModel) {
        showErrorDialog();
        return;
      }
      navigatorPop();
    }
  }

  bool get _validation {
    if (city.text.isNotEmpty &&
        state.text.isNotEmpty &&
        neighborhood.text.isNotEmpty &&
        street.text.isNotEmpty &&
        outDoorNumber.text.isNotEmpty &&
        doorNumber.text.isNotEmpty &&
        floor.text.isNotEmpty &&
        addressDirection.text.isNotEmpty) {
      if (customerName.text.isNotEmpty &&
          customerPhoneNumber.text.isNotEmpty &&
          paymentMethod.text.isNotEmpty &&
          selectedItems.isNotEmpty) {
        return true;
      }
      showErrorDialog("Müşteri bilgilerini eksiksiz giriniz.");
      return false;
    } else {
      showErrorDialog("Adres bilgilerini eksiksiz giriniz.");
      return false;
    }
  }

  OrderModel get _fetchOrder => OrderModel(
        paymentData:
            PaymentModel(cardData: null, totalPrice: calculateTotalCount()),
        menuData: selectedItems,
        addressData: _fetchAddress,
        paymentMethod: paymentMethod.text,
        restaurantName: "Restaurant Name",
        isPaidSuccess: paymentMethod.text == "Online Ödeme" ? true : false,
        orderState: WaitingRestaurantAccept.instance.text,
        orderCreationDate: DateTime.now().toIso8601String(),
        customerName: customerName.text,
        customerId: "restaurant-phone-order",
        restaurantId: localeManager.getStringData(LocaleKeysEnums.id.name),
        customerPhoneNumber: customerPhoneNumber.text,
        note: note.text,
        orderId: const Uuid().v4(),
      );

  AddressModel get _fetchAddress => AddressModel(
        name: "Restoran tarafından girildi",
        city: city.text,
        state: state.text,
        neighborhood: neighborhood.text,
        street: street.text,
        buildingNumber: outDoorNumber.text,
        doorNumber: doorNumber.text,
        floor: floor.text,
        addressDirection: addressDirection.text,
        isVerifiedFromCourier: false,
        uid: "entered-from-restaurant",
        addressOwner: customerName.text,
      );

  calculateTotalCount() {
    int totalPrice = 0;
    for (int i = 0; i <= selectedItems.length - 1; i++) {
      totalPrice += getSelectedElementPrice(i);
    }
    return totalPrice;
  }
}
