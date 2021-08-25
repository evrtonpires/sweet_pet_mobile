import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/login/login_module.dart';
import 'modules/shared/auth/auth_controller.dart';
import 'modules/shared/auth/auth_repositories/auth_repository.dart';
import 'modules/shared/auth/auth_repositories/auth_repository_interface.dart';
import 'modules/shared/sembast/sambest.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IAuthRepository>((i) => AuthRepository(i.get())),
    Bind.singleton((i) => AuthController()),
    Bind((i) => Dio()),
    Bind((i) => AppDatabase()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
