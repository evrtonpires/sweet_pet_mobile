import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel?> getLogin(
      {required String user, required String password, required context});

  Future<UserModel?> getSignUp(
      {required context, required UserModel userModel});

  Future<bool> getRecoverPasswordValidadeEmail(
      {required String email, required context});

  Future<bool> getRecoveryPassword(
      {required context,
      required String password,
      required String passwordConfirmation,
      required String code});
}
