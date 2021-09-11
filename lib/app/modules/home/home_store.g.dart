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
  String toString() {
    return '''
currentTabCardAnimal: ${currentTabCardAnimal},
currentTabItensAnimal: ${currentTabItensAnimal}
    ''';
  }
}
