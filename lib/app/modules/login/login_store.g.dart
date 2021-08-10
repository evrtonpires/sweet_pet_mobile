// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$loginAtom = Atom(name: 'LoginStoreBase.login');

  @override
  String? get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String? value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$messageLoginErrorAtom =
      Atom(name: 'LoginStoreBase.messageLoginError');

  @override
  String? get messageLoginError {
    _$messageLoginErrorAtom.reportRead();
    return super.messageLoginError;
  }

  @override
  set messageLoginError(String? value) {
    _$messageLoginErrorAtom.reportWrite(value, super.messageLoginError, () {
      super.messageLoginError = value;
    });
  }

  final _$passwordAtom = Atom(name: 'LoginStoreBase.password');

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
      Atom(name: 'LoginStoreBase.messagePasswordError');

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

  final _$isLoadingAtom = Atom(name: 'LoginStoreBase.isLoading');

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

  final _$keepConnectedAtom = Atom(name: 'LoginStoreBase.keepConnected');

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

  final _$autenticateAsyncAction = AsyncAction('LoginStoreBase.autenticate');

  @override
  Future<void> autenticate(BuildContext context) {
    return _$autenticateAsyncAction.run(() => super.autenticate(context));
  }

  final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase');

  @override
  void setLogin(String newLogin) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setLogin');
    try {
      return super.setLogin(newLogin);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String newPassword) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setPassword');
    try {
      return super.setPassword(newPassword);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
messageLoginError: ${messageLoginError},
password: ${password},
messagePasswordError: ${messagePasswordError},
isLoading: ${isLoading},
keepConnected: ${keepConnected}
    ''';
  }
}
