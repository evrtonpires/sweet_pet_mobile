// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardStore on _DashboardStoreBase, Store {
  final _$currentTabAtom = Atom(name: '_DashboardStoreBase.currentTab');

  @override
  int get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  final _$_DashboardStoreBaseActionController =
      ActionController(name: '_DashboardStoreBase');

  @override
  void setCurrentTab(int newTab) {
    final _$actionInfo = _$_DashboardStoreBaseActionController.startAction(
        name: '_DashboardStoreBase.setCurrentTab');
    try {
      return super.setCurrentTab(newTab);
    } finally {
      _$_DashboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab}
    ''';
  }
}
