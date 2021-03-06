import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;

abstract class _DashboardStoreBase with Store {
  @observable
  int currentTab = 0;

  @action
  void setCurrentTab(int newTab) => currentTab = newTab;
}
