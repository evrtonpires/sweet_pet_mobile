import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/dashboard/dashboard_module.dart';
import '../login/login_store.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ModuleRoute('/dashboard', module: DashboardModule())
  ];
}
