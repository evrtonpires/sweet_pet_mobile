import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_de_usuario/cadastro_de_usuario_module.dart';
import 'package:sweet_pet_mobile/app/modules/home/home_module.dart';
import 'package:sweet_pet_mobile/app/modules/recovery_password/recovery_password_module.dart';

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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => LoginPage(
        authController: Modular.get(),
      ),
    ),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/signup', module: CadastroDeUsuarioModule()),
    ModuleRoute('/recoveryPassword', module: RecoveryPasswordModule()),
  ];
}
