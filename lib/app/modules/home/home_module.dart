import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_pet/cadastro_pet_module.dart';
import 'package:sweet_pet_mobile/app/modules/home/home_store.dart';
import 'package:sweet_pet_mobile/app/modules/home/widgets/change_pet.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/pet_repository/pet_repository.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => HomeStore(
        authController: Modular.get(),
        petRepository: i.get(),
      ),
    ),
    Bind(
      (i) => PetRepository(
        dio: Modular.get(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(),
    ),
    ChildRoute(
      '/changePet',
      child: (_, args) => ChangePet(
        homeStore: Modular.get(),
      ),
    ),
    ModuleRoute('/cadpet', module: CadastroPetModule())
  ];
}
