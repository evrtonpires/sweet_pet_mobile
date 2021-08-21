import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';

abstract class IAuthRepository {
  Future getUser();

  Future<UserModel?> getLogin({required String user, required String password});

  Future getGoogleLogin();

  Future getFacebookLogin();

  Future<String> getToken();
}
