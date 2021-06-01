import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/app/auth/auth_repositories/auth_repository_interface.dart';

import 'auth/auth_repositories/auth_repository.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
