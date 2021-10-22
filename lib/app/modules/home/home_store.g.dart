// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$currentTabCardAnimalAtom =
      Atom(name: '_HomeStoreBase.currentTabCardAnimal');

  @override
  int get currentTabCardAnimal {
    _$currentTabCardAnimalAtom.reportRead();
    return super.currentTabCardAnimal;
  }

  @override
  set currentTabCardAnimal(int value) {
    _$currentTabCardAnimalAtom.reportWrite(value, super.currentTabCardAnimal,
        () {
      super.currentTabCardAnimal = value;
    });
  }

  final _$currentTabItensAnimalAtom =
      Atom(name: '_HomeStoreBase.currentTabItensAnimal');

  @override
  int get currentTabItensAnimal {
    _$currentTabItensAnimalAtom.reportRead();
    return super.currentTabItensAnimal;
  }

  @override
  set currentTabItensAnimal(int value) {
    _$currentTabItensAnimalAtom.reportWrite(value, super.currentTabItensAnimal,
        () {
      super.currentTabItensAnimal = value;
    });
  }

  final _$userAtom = Atom(name: '_HomeStoreBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$petAtom = Atom(name: '_HomeStoreBase.pet');

  @override
  PetModel? get pet {
    _$petAtom.reportRead();
    return super.pet;
  }

  @override
  set pet(PetModel? value) {
    _$petAtom.reportWrite(value, super.pet, () {
      super.pet = value;
    });
  }

  final _$imgAtom = Atom(name: '_HomeStoreBase.img');

  @override
  String? get img {
    _$imgAtom.reportRead();
    return super.img;
  }

  @override
  set img(String? value) {
    _$imgAtom.reportWrite(value, super.img, () {
      super.img = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$changeNamedPetAtom = Atom(name: '_HomeStoreBase.changeNamedPet');

  @override
  String get changeNamedPet {
    _$changeNamedPetAtom.reportRead();
    return super.changeNamedPet;
  }

  @override
  set changeNamedPet(String value) {
    _$changeNamedPetAtom.reportWrite(value, super.changeNamedPet, () {
      super.changeNamedPet = value;
    });
  }

  final _$setImgAsyncAction = AsyncAction('_HomeStoreBase.setImg');

  @override
  Future<dynamic> setImg() {
    return _$setImgAsyncAction.run(() => super.setImg());
  }

  final _$getPetsAsyncAction = AsyncAction('_HomeStoreBase.getPets');

  @override
  Future<void> getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setCurrentTabCardAnimal(int newTab) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setCurrentTabCardAnimal');
    try {
      return super.setCurrentTabCardAnimal(newTab);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTabItensAnimal(int newTab) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setCurrentTabItensAnimal');
    try {
      return super.setCurrentTabItensAnimal(newTab);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getUser() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.getUser');
    try {
      return super.getUser();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTabCardAnimal: ${currentTabCardAnimal},
currentTabItensAnimal: ${currentTabItensAnimal},
user: ${user},
pet: ${pet},
img: ${img},
isLoading: ${isLoading},
changeNamedPet: ${changeNamedPet}
    ''';
  }
}
