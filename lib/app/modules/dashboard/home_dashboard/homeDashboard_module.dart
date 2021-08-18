import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/homeDashboard_Page.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/homeDashboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeDashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeDashboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomeDashboardPage()),
  ];
}
