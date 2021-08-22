import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/app/modules/shared/sembast/login/user_sembast.dart';
import 'package:sweet_pet_mobile/util/alert_awesome/alert_awesome_widget.dart';

import 'auth_repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final CHAVE = '4Rtv9UH56xWtAyNcS5Yr3jrPmWs26Wa6';
  final LENGHT_VETOR = 16;

  final IAuthRepository _authRepository = Modular.get();

  UserModel? userModel = UserModel.padrao();

  Future<bool?> signIn({
    required String user,
    required String password,
    required context,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      UserSembast userSembast = UserSembast();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        password = encrypt(password);
        userModel = await _authRepository.getLogin(
            user: user, password: password, context: context);
        if (userModel != null) {
          UserModel? listUserModel = await userSembast.get(userModel!);
          if (listUserModel == null) {
            userModel!.password = password;
            await userSembast.insert(userModel!);
          }
          saveUserSharedPrefs(stringValue: 'userValue', data: user);
          saveUserSharedPrefs(
              stringValue: 'passwordValue', data: decrypt(password));
          return true;
        } else {
          return false;
        }
      } else {
        List<UserModel> listUserModel = await userSembast.getAllLogin();
        if (listUserModel.isNotEmpty) {
          bool autenticado = false;
          for (UserModel umodel in listUserModel) {
            if (umodel.email.toLowerCase() == user.toLowerCase() &&
                umodel.password == encrypt(password)) {
              userModel = umodel;
              autenticado = true;
            }
          }

          if (autenticado) {
            return true;
          } else {
            AwesomeDialogWidget(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.NO_HEADER,
                title: 'Erro ao obter acesso',
                text:
                    'Os dados de acesso para o login off-line estão incorretos.\nVerifique os dados e tente novamente!',
                buttonColor: Colors.red.shade800,
                btnOkOnPress: () {});
            return false;
          }
        } else {
          AwesomeDialogWidget(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.NO_HEADER,
              title: 'Erro ao obter acesso',
              text:
                  'Caso tenha um cadastro conosco, ative sua internet e realize o login para termos os dados necessarios em nossa base local.\n\nCaso não tenha, obtenha um cadastro em nosso aplicativo para realizar o login.',
              buttonColor: Colors.red.shade800,
              btnOkOnPress: () {});
          return false;
        }
      }
    } catch (e) {
      print(e);

      return false;
    }
  }

  //----------------------------------------------------------------------------
  Future<bool?> signUp({
    required UserModel user,
    required context,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      UserSembast userSembast = UserSembast();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        user.password = encrypt(user.password);
        userModel =
        await _authRepository.getSignUp(userModel: user, context: context);
        if (userModel != null) {
          UserModel? listUserModel = await userSembast.get(userModel!);
          if (listUserModel == null) {
            userModel!.password = user.password;
            await userSembast.insert(userModel!);
          }
          saveUserSharedPrefs(stringValue: 'userValue', data: userModel!.email);
          saveUserSharedPrefs(
              stringValue: 'passwordValue', data: decrypt(userModel!.password));
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print(e);

      return false;
    }
  }

  //----------------------------------------------------------------------------
  Future<String> getUserSharedPref({required stringValue}) async {
    final prefs = await SharedPreferences.getInstance();
    final userValue = prefs.getString('$stringValue');
    if (userValue == null) {
      return '';
    }
    return userValue;
  }

  //----------------------------------------------------------------------------
  saveUserSharedPrefs({required stringValue, required data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('$stringValue', "$data");
  }

  //----------------------------------------------------------------------------
  String encrypt(senha) {
    final encrypter = Encrypter(AES(Encrypt.Key.fromUtf8(CHAVE)));
    final senhaEncrypted =
    encrypter.encrypt(senha, iv: IV.fromLength(LENGHT_VETOR));
    return senhaEncrypted.base64;
  }

  //----------------------------------------------------------------------------
  String decrypt(senhaEncrypted) {
    final encrypter = Encrypter(AES(Encrypt.Key.fromUtf8(CHAVE)));
    final decrypted =
    encrypter.decrypt64(senhaEncrypted, iv: IV.fromLength(LENGHT_VETOR));
    return decrypted;
  }

  //----------------------------------------------------------------------------

  signOut() {}
}
