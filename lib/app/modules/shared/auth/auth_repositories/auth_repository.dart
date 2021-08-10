import 'package:dio/dio.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_repositories/auth_repository_interface.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/login/login_model.dart';

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
  Future getLogin() {
    // TODO: implement getLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<LoginModel?> getUser() async {
    try {
      Response response = await dio
          .get("https://run.mocky.io/v3/2c6665b0-f00f-4734-bc60-b5294a622e82")
          .catchError((e) {
        print(e);
      });
      return LoginModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
