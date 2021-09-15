import 'package:flutter_modular/flutter_modular.dart';

import 'recovery_password_page.dart';
import 'recovery_password_store.dart';

class RecoveryPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => RecoveryPasswordStore(authController: Modular.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => RecoveryPasswordPage(
        authController: Modular.get(),
        store: Modular.get(),
      ),
    ),
  ];
}
