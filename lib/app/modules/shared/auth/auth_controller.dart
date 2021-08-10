import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/login/login_model.dart';

import 'auth_repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final IAuthRepository _authRepository = Modular.get();

  Future<LoginModel?> signIn() async {
    LoginModel login = await _authRepository.getUser();
    print(login);
  }

  signUp() {}

  logout() {}
}
