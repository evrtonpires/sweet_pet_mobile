import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';

abstract class IAuthRepository {
  Future getUser();

  Future<UserModel?> getLogin(
      {required String user, required String password, required context});

  Future getGoogleLogin();

  Future<UserModel?> getSignUp(
      {required context, required UserModel userModel});

  Future getFacebookLogin();

  Future<String> getToken();
}
