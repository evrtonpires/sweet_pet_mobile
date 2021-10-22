// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_pet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroPetStore on _CadastroPetStoreBase, Store {
  final _$isEditingAtom = Atom(name: '_CadastroPetStoreBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CadastroPetStoreBase.isLoading');

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

  final _$nameAtom = Atom(name: '_CadastroPetStoreBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$messageNameErrorAtom =
      Atom(name: '_CadastroPetStoreBase.messageNameError');

  @override
  String? get messageNameError {
    _$messageNameErrorAtom.reportRead();
    return super.messageNameError;
  }

  @override
  set messageNameError(String? value) {
    _$messageNameErrorAtom.reportWrite(value, super.messageNameError, () {
      super.messageNameError = value;
    });
  }

  final _$birthdayAtom = Atom(name: '_CadastroPetStoreBase.birthday');

  @override
  DateTime? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$messageBirthdayErrorAtom =
      Atom(name: '_CadastroPetStoreBase.messageBirthdayError');

  @override
  String? get messageBirthdayError {
    _$messageBirthdayErrorAtom.reportRead();
    return super.messageBirthdayError;
  }

  @override
  set messageBirthdayError(String? value) {
    _$messageBirthdayErrorAtom.reportWrite(value, super.messageBirthdayError,
        () {
      super.messageBirthdayError = value;
    });
  }

  final _$breedAtom = Atom(name: '_CadastroPetStoreBase.breed');

  @override
  String? get breed {
    _$breedAtom.reportRead();
    return super.breed;
  }

  @override
  set breed(String? value) {
    _$breedAtom.reportWrite(value, super.breed, () {
      super.breed = value;
    });
  }

  final _$messageBreedErrorAtom =
      Atom(name: '_CadastroPetStoreBase.messageBreedError');

  @override
  String? get messageBreedError {
    _$messageBreedErrorAtom.reportRead();
    return super.messageBreedError;
  }

  @override
  set messageBreedError(String? value) {
    _$messageBreedErrorAtom.reportWrite(value, super.messageBreedError, () {
      super.messageBreedError = value;
    });
  }

  final _$weightAtom = Atom(name: '_CadastroPetStoreBase.weight');

  @override
  String? get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(String? value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  final _$messageWeightErrorAtom =
      Atom(name: '_CadastroPetStoreBase.messageWeightError');

  @override
  String? get messageWeightError {
    _$messageWeightErrorAtom.reportRead();
    return super.messageWeightError;
  }

  @override
  set messageWeightError(String? value) {
    _$messageWeightErrorAtom.reportWrite(value, super.messageWeightError, () {
      super.messageWeightError = value;
    });
  }

  final _$specieAtom = Atom(name: '_CadastroPetStoreBase.specie');

  @override
  eSpecie get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(eSpecie value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  final _$genderAtom = Atom(name: '_CadastroPetStoreBase.gender');

  @override
  eGender get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(eGender value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$autenticateAsyncAction =
      AsyncAction('_CadastroPetStoreBase.autenticate');

  @override
  Future<void> autenticate(BuildContext context, {PetModel? petModelEditing}) {
    return _$autenticateAsyncAction.run(
        () => super.autenticate(context, petModelEditing: petModelEditing));
  }

  final _$setPetAsyncAction = AsyncAction('_CadastroPetStoreBase.setPet');

  @override
  Future<bool?> setPet(
      {required dynamic context, required PetModel? petModelEditing}) {
    return _$setPetAsyncAction.run(
        () => super.setPet(context: context, petModelEditing: petModelEditing));
  }

  final _$_CadastroPetStoreBaseActionController =
      ActionController(name: '_CadastroPetStoreBase');

  @override
  void setName(String newName) {
    final _$actionInfo = _$_CadastroPetStoreBaseActionController.startAction(
        name: '_CadastroPetStoreBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_CadastroPetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic Function(DateTime?)? setBirthday(dynamic newBirthday) {
    final _$actionInfo = _$_CadastroPetStoreBaseActionController.startAction(
        name: '_CadastroPetStoreBase.setBirthday');
    try {
      return super.setBirthday(newBirthday);
    } finally {
      _$_CadastroPetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBreed(String newBreed) {
    final _$actionInfo = _$_CadastroPetStoreBaseActionController.startAction(
        name: '_CadastroPetStoreBase.setBreed');
    try {
      return super.setBreed(newBreed);
    } finally {
      _$_CadastroPetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWeight(String newWeight) {
    final _$actionInfo = _$_CadastroPetStoreBaseActionController.startAction(
        name: '_CadastroPetStoreBase.setWeight');
    try {
      return super.setWeight(newWeight);
    } finally {
      _$_CadastroPetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpecie(eSpecie newSpecie) {
    final _$actionInfo = _$_CadastroPetStoreBaseActionController.startAction(
        name: '_CadastroPetStoreBase.setSpecie');
    try {
      return super.setSpecie(newSpecie);
    } finally {
      _$_CadastroPetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(eGender newGender) {
    final _$actionInfo = _$_CadastroPetStoreBaseActionController.startAction(
        name: '_CadastroPetStoreBase.setGender');
    try {
      return super.setGender(newGender);
    } finally {
      _$_CadastroPetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEditing: ${isEditing},
isLoading: ${isLoading},
name: ${name},
messageNameError: ${messageNameError},
birthday: ${birthday},
messageBirthdayError: ${messageBirthdayError},
breed: ${breed},
messageBreedError: ${messageBreedError},
weight: ${weight},
messageWeightError: ${messageWeightError},
specie: ${specie},
gender: ${gender}
    ''';
  }
}
