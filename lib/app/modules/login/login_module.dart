import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_de_usuario/cadastro_de_usuario_module.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/dashboard_module.dart';
import 'package:sweet_pet_mobile/app/modules/shared/sembast/sambest.dart';
import '../login/login_store.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => LoginStore(
        authController: Modular.get(),
      ),
    ),
    Bind((i) => AppDatabase(authController: Modular.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => LoginPage(
        authController: Modular.get(),
      ),
    ),
    ModuleRoute('/dashboard', module: DashboardModule()),
    ModuleRoute('/signup', module: CadastroDeUsuarioModule()),
  ];
}
