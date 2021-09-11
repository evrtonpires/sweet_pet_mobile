import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int currentTabCardAnimal = 0;

  @action
  void setCurrentTabCardAnimal(int newTab) => currentTabCardAnimal = newTab;

  @observable
  int currentTabItensAnimal = 0;

  @action
  void setCurrentTabItensAnimal(int newTab) => currentTabItensAnimal = newTab;
}
