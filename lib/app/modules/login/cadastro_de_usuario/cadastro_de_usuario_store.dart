import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';

part 'cadastro_de_usuario_store.g.dart';

class CadastroDeUsuarioStore = _CadastroDeUsuarioStoreBase
    with _$CadastroDeUsuarioStore;

abstract class _CadastroDeUsuarioStoreBase with Store {
  _CadastroDeUsuarioStoreBase({required this.authController}) {
    focusName = FocusNode();
    focusEmail = FocusNode();
    focusPassword = FocusNode();
    focusPasswordConfirmation = FocusNode();
    focusCRMV = FocusNode();
  }

  final AuthController authController;

  late final FocusNode focusName;
  late final FocusNode focusEmail;
  late final FocusNode focusPassword;
  late final FocusNode focusPasswordConfirmation;
  late final FocusNode focusCRMV;

  @observable
  bool isLoading = false;

  @observable
  bool keepConnected = true;

//----------------------------------------------------------------------------
  @observable
  String? name;

  @action
  void setName(String newName) => name = newName;

  @observable
  String? messageNameError;

//----------------------------------------------------------------------------

  @observable
  String? email;

  @action
  void setEmail(String newEmail) => email = newEmail;

  @observable
  String? messageEmailError;

//----------------------------------------------------------------------------
  @observable
  String? password;

  @action
  void setPassword(String newPassword) => password = newPassword;

  @observable
  String? messagePasswordError;

//----------------------------------------------------------------------------
  @observable
  String? passwordConfirmation;

  @action
  void setPasswordConfirmation(String newPasswordConfirmation) =>
      passwordConfirmation = newPasswordConfirmation;

  @observable
  String? messagePasswordConfirmationError;

//----------------------------------------------------------------------------
  @observable
  String? crmv;

  @action
  void setCRMV(String newCRMV) => crmv = newCRMV;

  @observable
  String? messageCRMVError;

//----------------------------------------------------------------------------

  @observable
  int? intETypeUser = 1;

  @action
  void setUserOrCRMV(int value) {
    intETypeUser = value;
  }

//----------------------------------------------------------------------------
  bool nameValidate(BuildContext context, {bool requestFocus = false}) {
    messageNameError = null;
    if (name == null || name!.isEmpty) {
      messageNameError = 'Campo obrigatório';
      if (requestFocus) {
        focusName.requestFocus();
      }
      return false;
    }
    return true;
  }

  //----------------------------------------------------------------------------
  bool emailValidate(BuildContext context, {bool requestFocus = false}) {
    messageEmailError = null;
    if (email == null || email!.isEmpty) {
      messageEmailError = 'Campo obrigatório';
      if (requestFocus) {
        focusEmail.requestFocus();
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
    } else if ((passwordConfirmation != null &&
            passwordConfirmation!.isNotEmpty) &&
        password != passwordConfirmation) {
      messagePasswordConfirmationError = 'As senhas não coincidem';
      if (requestFocus) {
        focusPasswordConfirmation.requestFocus();
      }
      return false;
    } else {
      messagePasswordConfirmationError = null;
      messagePasswordError = null;
    }
    return true;
  }

  //----------------------------------------------------------------------------
  bool passwordConfirmationValidate(BuildContext context,
      {bool requestFocus = false}) {
    messagePasswordConfirmationError = null;
    if (passwordConfirmation == null || passwordConfirmation!.isEmpty) {
      messagePasswordConfirmationError = 'Campo obrigatório';
      if (requestFocus) {
        focusPasswordConfirmation.requestFocus();
      }
      return false;
    } else if (password != passwordConfirmation) {
      messagePasswordConfirmationError = 'As senhas não coincidem';
      if (requestFocus) {
        focusPasswordConfirmation.requestFocus();
      }
      return false;
    } else {
      messagePasswordConfirmationError = null;
      messagePasswordError = null;
    }
    return true;
  }

  //----------------------------------------------------------------------------
  bool crmvValidate(BuildContext context, {bool requestFocus = false}) {
    messageCRMVError = null;
    if (crmv == null || crmv!.isEmpty && intETypeUser == 2) {
      messageCRMVError = 'Campo obrigatório';
      if (requestFocus) {
        focusCRMV.requestFocus();
      }
      return false;
    } else {
      crmv = null;
    }
    return true;
  }

//----------------------------------------------------------------------------
  @action
  Future<void> autenticate(BuildContext context) async {
    if (!nameValidate(context, requestFocus: true)) {
      return;
    }
    if (!emailValidate(context, requestFocus: true)) {
      return;
    }
    if (!passwordValidate(context, requestFocus: true)) {
      return;
    }
    if (!passwordConfirmationValidate(context, requestFocus: true)) {
      return;
    }
    if (intETypeUser == 2 && !crmvValidate(context, requestFocus: true)) {
      return;
    }
    if (messageNameError == null &&
        messageEmailError == null &&
        messagePasswordError == null &&
        messageCRMVError == null &&
        !isLoading) {
      int etype;
      if (intETypeUser == 2) {
        etype = eTypeUser.VETERINARIAN.index;
      } else {
        etype = eTypeUser.USER.index;
      }

      UserModel user = UserModel(
          id: null,
          name: name!,
          email: email!,
          password: password!,
          eType: etype,
          crmv: crmv);

      isLoading = true;
      bool? response = await authController.signUp(
        user: user,
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
//----------------------------------------------------------------------------
}
