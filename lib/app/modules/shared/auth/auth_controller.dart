import 'package:connectivity/connectivity.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/app/modules/shared/sembast/login/user_sembast.dart';

import 'auth_repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final CHAVE = '4Rtv9UH56xWtAyNcS5Yr3jrPmWs26Wa6';
  final LENGHT_VETOR = 16;

  final IAuthRepository _authRepository = Modular.get();

  UserModel? userModel = UserModel.padrao();

  Future<bool?> signIn({required String user, required String password}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      UserSembast userSembast = UserSembast();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        userModel =
            await _authRepository.getLogin(user: user, password: password);
        if (userModel != null) {
          UserModel? listUserModel = await userSembast.get(userModel!);
          if (listUserModel == null) {
            userModel!.password = encrypt(password);
            await userSembast.insert(userModel!);
          }
          saveUserSharedPrefs(stringValue: 'userValue', data: user);
          saveUserSharedPrefs(stringValue: 'passwordValue', data: password);
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
            // builAwasomeDialog("msgValidacoesTelaLogin.msgSemConexao", context,
            //     title: 'Erro ao logar');
            return false;
          }
        } else {
          // Navigator.of(context).pop();
          // builAwasomeDialog("msgValidacoesTelaLogin.msgSemConexao", context,
          //     title: 'Erro ao logar');
          // return false;
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

  signUp() {}

  logout() {}
}
