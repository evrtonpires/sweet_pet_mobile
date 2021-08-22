// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_de_usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroDeUsuarioStore on _CadastroDeUsuarioStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_CadastroDeUsuarioStoreBase.isLoading');

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

  final _$keepConnectedAtom =
      Atom(name: '_CadastroDeUsuarioStoreBase.keepConnected');

  @override
  bool get keepConnected {
    _$keepConnectedAtom.reportRead();
    return super.keepConnected;
  }

  @override
  set keepConnected(bool value) {
    _$keepConnectedAtom.reportWrite(value, super.keepConnected, () {
      super.keepConnected = value;
    });
  }

  final _$nameAtom = Atom(name: '_CadastroDeUsuarioStoreBase.name');

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
      Atom(name: '_CadastroDeUsuarioStoreBase.messageNameError');

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

  final _$emailAtom = Atom(name: '_CadastroDeUsuarioStoreBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$messageEmailErrorAtom =
      Atom(name: '_CadastroDeUsuarioStoreBase.messageEmailError');

  @override
  String? get messageEmailError {
    _$messageEmailErrorAtom.reportRead();
    return super.messageEmailError;
  }

  @override
  set messageEmailError(String? value) {
    _$messageEmailErrorAtom.reportWrite(value, super.messageEmailError, () {
      super.messageEmailError = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CadastroDeUsuarioStoreBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$messagePasswordErrorAtom =
      Atom(name: '_CadastroDeUsuarioStoreBase.messagePasswordError');

  @override
  String? get messagePasswordError {
    _$messagePasswordErrorAtom.reportRead();
    return super.messagePasswordError;
  }

  @override
  set messagePasswordError(String? value) {
    _$messagePasswordErrorAtom.reportWrite(value, super.messagePasswordError,
        () {
      super.messagePasswordError = value;
    });
  }

  final _$passwordConfirmationAtom =
      Atom(name: '_CadastroDeUsuarioStoreBase.passwordConfirmation');

  @override
  String? get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String? value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  final _$messagePasswordConfirmationErrorAtom = Atom(
      name: '_CadastroDeUsuarioStoreBase.messagePasswordConfirmationError');

  @override
  String? get messagePasswordConfirmationError {
    _$messagePasswordConfirmationErrorAtom.reportRead();
    return super.messagePasswordConfirmationError;
  }

  @override
  set messagePasswordConfirmationError(String? value) {
    _$messagePasswordConfirmationErrorAtom
        .reportWrite(value, super.messagePasswordConfirmationError, () {
      super.messagePasswordConfirmationError = value;
    });
  }

  final _$crmvAtom = Atom(name: '_CadastroDeUsuarioStoreBase.crmv');

  @override
  String? get crmv {
    _$crmvAtom.reportRead();
    return super.crmv;
  }

  @override
  set crmv(String? value) {
    _$crmvAtom.reportWrite(value, super.crmv, () {
      super.crmv = value;
    });
  }

  final _$messageCRMVErrorAtom =
      Atom(name: '_CadastroDeUsuarioStoreBase.messageCRMVError');

  @override
  String? get messageCRMVError {
    _$messageCRMVErrorAtom.reportRead();
    return super.messageCRMVError;
  }

  @override
  set messageCRMVError(String? value) {
    _$messageCRMVErrorAtom.reportWrite(value, super.messageCRMVError, () {
      super.messageCRMVError = value;
    });
  }

  final _$intETypeUserAtom =
      Atom(name: '_CadastroDeUsuarioStoreBase.intETypeUser');

  @override
  int? get intETypeUser {
    _$intETypeUserAtom.reportRead();
    return super.intETypeUser;
  }

  @override
  set intETypeUser(int? value) {
    _$intETypeUserAtom.reportWrite(value, super.intETypeUser, () {
      super.intETypeUser = value;
    });
  }

  final _$autenticateAsyncAction =
      AsyncAction('_CadastroDeUsuarioStoreBase.autenticate');

  @override
  Future<void> autenticate(BuildContext context) {
    return _$autenticateAsyncAction.run(() => super.autenticate(context));
  }

  final _$_CadastroDeUsuarioStoreBaseActionController =
      ActionController(name: '_CadastroDeUsuarioStoreBase');

  @override
  void setName(String newName) {
    final _$actionInfo = _$_CadastroDeUsuarioStoreBaseActionController
        .startAction(name: '_CadastroDeUsuarioStoreBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_CadastroDeUsuarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String newEmail) {
    final _$actionInfo = _$_CadastroDeUsuarioStoreBaseActionController
        .startAction(name: '_CadastroDeUsuarioStoreBase.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$_CadastroDeUsuarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String newPassword) {
    final _$actionInfo = _$_CadastroDeUsuarioStoreBaseActionController
        .startAction(name: '_CadastroDeUsuarioStoreBase.setPassword');
    try {
      return super.setPassword(newPassword);
    } finally {
      _$_CadastroDeUsuarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordConfirmation(String newPasswordConfirmation) {
    final _$actionInfo =
        _$_CadastroDeUsuarioStoreBaseActionController.startAction(
            name: '_CadastroDeUsuarioStoreBase.setPasswordConfirmation');
    try {
      return super.setPasswordConfirmation(newPasswordConfirmation);
    } finally {
      _$_CadastroDeUsuarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCRMV(String newCRMV) {
    final _$actionInfo = _$_CadastroDeUsuarioStoreBaseActionController
        .startAction(name: '_CadastroDeUsuarioStoreBase.setCRMV');
    try {
      return super.setCRMV(newCRMV);
    } finally {
      _$_CadastroDeUsuarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserOrCRMV(int value) {
    final _$actionInfo = _$_CadastroDeUsuarioStoreBaseActionController
        .startAction(name: '_CadastroDeUsuarioStoreBase.setUserOrCRMV');
    try {
      return super.setUserOrCRMV(value);
    } finally {
      _$_CadastroDeUsuarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
keepConnected: ${keepConnected},
name: ${name},
messageNameError: ${messageNameError},
email: ${email},
messageEmailError: ${messageEmailError},
password: ${password},
messagePasswordError: ${messagePasswordError},
passwordConfirmation: ${passwordConfirmation},
messagePasswordConfirmationError: ${messagePasswordConfirmationError},
crmv: ${crmv},
messageCRMVError: ${messageCRMVError},
intETypeUser: ${intETypeUser}
    ''';
  }
}
