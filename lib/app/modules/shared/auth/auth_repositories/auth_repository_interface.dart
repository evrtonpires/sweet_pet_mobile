import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel?> getLogin(
      {required String user,
      required String password,
      required AuthController authController,
      required context});

  Future<UserModel?> getSignUp({
    required context,
    required UserModel userModel,
    required AuthController authController,
  });

  Future<bool> getRecoverPasswordValidadeEmail(
      {required String email, required context});

  Future<bool> getRecoveryPassword(
      {required context,
      required String password,
      required String passwordConfirmation,
      required String code});
}
