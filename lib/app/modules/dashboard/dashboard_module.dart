import 'package:sweet_pet_mobile/app/modules/dashboard/dashboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/home/home_store.dart';

import 'dashboard_page.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => DashboardPage(
        authController: Modular.get(),
      ),
    ),
  ];
}
