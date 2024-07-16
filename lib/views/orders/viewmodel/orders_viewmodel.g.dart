// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersViewModel on _OrdersViewModelBase, Store {
  late final _$activeOrdersAtom =
      Atom(name: '_OrdersViewModelBase.activeOrders', context: context);

  @override
  ObservableList<OrderModel> get activeOrders {
    _$activeOrdersAtom.reportRead();
    return super.activeOrders;
  }

  @override
  set activeOrders(ObservableList<OrderModel> value) {
    _$activeOrdersAtom.reportWrite(value, super.activeOrders, () {
      super.activeOrders = value;
    });
  }

  late final _$orderLogsAtom =
      Atom(name: '_OrdersViewModelBase.orderLogs', context: context);

  @override
  ObservableList<OrderModel> get orderLogs {
    _$orderLogsAtom.reportRead();
    return super.orderLogs;
  }

  @override
  set orderLogs(ObservableList<OrderModel> value) {
    _$orderLogsAtom.reportWrite(value, super.orderLogs, () {
      super.orderLogs = value;
    });
  }

  late final _$orderLogCountAtom =
      Atom(name: '_OrdersViewModelBase.orderLogCount', context: context);

  @override
  int get orderLogCount {
    _$orderLogCountAtom.reportRead();
    return super.orderLogCount;
  }

  @override
  set orderLogCount(int value) {
    _$orderLogCountAtom.reportWrite(value, super.orderLogCount, () {
      super.orderLogCount = value;
    });
  }

  late final _$totalRevenueAtom =
      Atom(name: '_OrdersViewModelBase.totalRevenue', context: context);

  @override
  int get totalRevenue {
    _$totalRevenueAtom.reportRead();
    return super.totalRevenue;
  }

  @override
  set totalRevenue(int value) {
    _$totalRevenueAtom.reportWrite(value, super.totalRevenue, () {
      super.totalRevenue = value;
    });
  }

  late final _$selectedTimeRangeAtom =
      Atom(name: '_OrdersViewModelBase.selectedTimeRange', context: context);

  @override
  ObservableList<String> get selectedTimeRange {
    _$selectedTimeRangeAtom.reportRead();
    return super.selectedTimeRange;
  }

  @override
  set selectedTimeRange(ObservableList<String> value) {
    _$selectedTimeRangeAtom.reportWrite(value, super.selectedTimeRange, () {
      super.selectedTimeRange = value;
    });
  }

  late final _$getOrderLogsAsyncAction =
      AsyncAction('_OrdersViewModelBase.getOrderLogs', context: context);

  @override
  Future<bool> getOrderLogs() {
    return _$getOrderLogsAsyncAction.run(() => super.getOrderLogs());
  }

  late final _$cancelOrderAsyncAction =
      AsyncAction('_OrdersViewModelBase.cancelOrder', context: context);

  @override
  Future<void> cancelOrder(OrderModel data) {
    return _$cancelOrderAsyncAction.run(() => super.cancelOrder(data));
  }

  late final _$pickDateAsyncAction =
      AsyncAction('_OrdersViewModelBase.pickDate', context: context);

  @override
  Future<void> pickDate() {
    return _$pickDateAsyncAction.run(() => super.pickDate());
  }

  late final _$_OrdersViewModelBaseActionController =
      ActionController(name: '_OrdersViewModelBase', context: context);

  @override
  dynamic _listenOrderChannel() {
    final _$actionInfo = _$_OrdersViewModelBaseActionController.startAction(
        name: '_OrdersViewModelBase._listenOrderChannel');
    try {
      return super._listenOrderChannel();
    } finally {
      _$_OrdersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _listenOrderStateUpdate(OrderModel data) {
    final _$actionInfo = _$_OrdersViewModelBaseActionController.startAction(
        name: '_OrdersViewModelBase._listenOrderStateUpdate');
    try {
      return super._listenOrderStateUpdate(data);
    } finally {
      _$_OrdersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeOrderState(OrderState currentOrderState, int index) {
    final _$actionInfo = _$_OrdersViewModelBaseActionController.startAction(
        name: '_OrdersViewModelBase.changeOrderState');
    try {
      return super.changeOrderState(currentOrderState, index);
    } finally {
      _$_OrdersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeOrders: ${activeOrders},
orderLogs: ${orderLogs},
orderLogCount: ${orderLogCount},
totalRevenue: ${totalRevenue},
selectedTimeRange: ${selectedTimeRange}
    ''';
  }
}
