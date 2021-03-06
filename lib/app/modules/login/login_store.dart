import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  // AuthController auth = Modular.get();

  //----------------------------------------------------------------------------
  LoginStoreBase({this.authController}) {
    focusLogin = FocusNode();
    focusPassword = FocusNode();
  }

  final AuthController? authController;
  late final FocusNode focusLogin;
  late final FocusNode focusPassword;

  //----------------------------------------------------------------------------
  @observable
  String? user;

  //----------------------------------------------------------------------------
  @action
  void setLogin(String newUser) => user = newUser;

  //----------------------------------------------------------------------------
  @observable
  String? messageLoginError;

  //----------------------------------------------------------------------------
  @observable
  String? password;

  //----------------------------------------------------------------------------
  @action
  void setPassword(String newPassword) => password = newPassword;

  //----------------------------------------------------------------------------
  @observable
  String? messagePasswordError;

  //----------------------------------------------------------------------------
  @observable
  bool isLoading = false;

  //----------------------------------------------------------------------------
  @observable
  bool keepConnected = true;

  //----------------------------------------------------------------------------
  bool loginValidate(BuildContext context, {bool requestFocus = false}) {
    messageLoginError = null;
    if (user == null || user!.isEmpty) {
      messageLoginError = 'Campo obrigatório';
      if (requestFocus) {
        focusLogin.requestFocus();
      }
      return false;
    }
    return true;
  }

  //----------------------------------------------------------------------------
  bool passwordValidate(BuildContext context, {bool requestFocus = false}) {
    messagePasswordError = null;
    if (password == null || password!.isEmpty) {
      messagePasswordError = 'Campo obrigatório';
      if (requestFocus) {
        focusPassword.requestFocus();
      }
      return false;
    }
    return true;
  }

  //----------------------------------------------------------------------------
  @action
  Future<void> autenticate(BuildContext context) async {
    if (!loginValidate(context, requestFocus: true)) {
      return;
    }
    if (!passwordValidate(context, requestFocus: true)) {
      return;
    }
    if (messageLoginError == null &&
        messagePasswordError == null &&
        !isLoading) {
      isLoading = true;
      bool? response = await authController!.signIn(
        user: user!.trim(),
        password: password!.trim(),
        context: context,
      );
      if (response!) {
        isLoading = false;
        Modular.to.pushReplacementNamed('/dashboard');
      } else {
        isLoading = false;
      }
    }
  }
}
