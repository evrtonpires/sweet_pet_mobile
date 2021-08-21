import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_repositories/auth_repository_interface.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/util/alert_awesome/alert_awesome_widget.dart';
import 'package:sweet_pet_mobile/util/constants/base_url.dart';

class AuthRepository implements IAuthRepository {
  final Dio dio;

  AuthRepository(this.dio) {
    dio.options.receiveTimeout = 36000;
  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future getGoogleLogin() {
    // TODO: implement getGoogleLogin
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getLogin(
      {required String user, required String password, context}) async {
    try {
      Response response = await dio.post('${BaseUrl.baseUrl}/Auth',
          data: {'login': user, 'password': password}).catchError((e) {
        AwesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            text: e.response.data[0]['message'],
            title: e.response.data[0]['title'],
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
      });
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUser() async {}
}
