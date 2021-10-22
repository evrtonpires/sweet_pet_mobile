import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_repositories/auth_repository_interface.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/util/alert_awesome/alert_awesome_widget.dart';
import 'package:sweet_pet_mobile/util/constants/base_url.dart';

import '../auth_controller.dart';

class AuthRepository implements IAuthRepository {
  final Dio dio;

  AuthRepository({required this.dio}) {
    dio.options.receiveTimeout = 36000;
  }

//----------------------------------------------------------------------------
  @override
  Future<UserModel?> getLogin({
    required String user,
    required String password,
    required AuthController authController,
    context,
  }) async {
    try {
      Response response = await dio.post('${BaseUrl.baseUrl}/Auth',
          data: {'login': user, 'password': password}).catchError((e) {
        AwesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            text: e.response.data['messages'][0]['message'],
            title: e.response.data['title'],
            borderColor: Colors.red,
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
      });
      authController.token = response.data['token'];
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      print(e);
    }
  }

//----------------------------------------------------------------------------
  @override
  Future<UserModel?> getSignUp({
    context,
    required userModel,
    required AuthController authController,
  }) async {
    try {
      Response response = await dio
          .post('${BaseUrl.baseUrl}/User', data: userModel)
          .catchError((e) {
        AwesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            text: e.response.data['messages'][0]['message'],
            title: e.response.data['title'],
            borderColor: Colors.red,
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
      });
      authController.token = response.data['token'];
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      print(e);
    }
  }

//----------------------------------------------------------------------------
  @override
  Future<bool> getRecoverPasswordValidadeEmail(
      {required String email, context}) async {
    try {
      Response response = await dio.post(
        '${BaseUrl.baseUrl}/User/RecoverPassMail',
        data: {"email": email},
      ).catchError((e) {
        if (e.response.statusCode == 404) {
          AwesomeDialogWidget(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.NO_HEADER,
              text: e.response.data['messages'][0]['message'],
              title: e.response.data['title'],
              borderColor: Colors.red,
              buttonColor: Colors.red.shade800,
              btnOkOnPress: () {});
        } else {
          AwesomeDialogWidget(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.NO_HEADER,
              text: e.response.data['errors'][0]['message'],
              title: e.response.data['title'],
              borderColor: Colors.red,
              buttonColor: Colors.red.shade800,
              btnOkOnPress: () {});
        }
      });
      return response.data["success"];
    } catch (e) {
      print(e);
      return false;
    }
  }

  //----------------------------------------------------------------------------
  @override
  Future<bool> getRecoveryPassword({
    context,
    required String password,
    required String passwordConfirmation,
    required String code,
  }) async {
    try {
      Response response = await dio.post(
        '${BaseUrl.baseUrl}/User/ReplacePassByCode',
        data: {
          "newPass": password.trim(),
          "confirmPass": passwordConfirmation.trim(),
          "code": code.toUpperCase().trim(),
        },
      ).catchError((e) {
        if (e.response.statusCode == 404) {
          AwesomeDialogWidget(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.NO_HEADER,
              text: e.response.data['messages'][0]['message'],
              title: e.response.data['title'],
              borderColor: Colors.red,
              buttonColor: Colors.red.shade800,
              btnOkOnPress: () {});
        } else {
          AwesomeDialogWidget(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.NO_HEADER,
              text: e.response.data['errors'][0]['message'],
              title: e.response.data['ttle'],
              borderColor: Colors.red,
              buttonColor: Colors.red.shade800,
              btnOkOnPress: () {});
        }
      });
      return response.data["success"];
    } catch (e) {
      print(e);
      return false;
    }
  }
//----------------------------------------------------------------------------
}
