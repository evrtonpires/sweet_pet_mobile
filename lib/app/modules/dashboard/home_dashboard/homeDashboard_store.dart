import 'package:mobx/mobx.dart';

part 'homeDashboard_store.g.dart';

class HomeDashboardStore = _HomeDashboardStoreBase with _$HomeDashboardStore;

abstract class _HomeDashboardStoreBase with Store {
  @observable
  int currentTab = 0;

  @action
  void setCurrentTab(int newTab) => currentTab = newTab;
}
