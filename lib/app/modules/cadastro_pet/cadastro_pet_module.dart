import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_pet/cadastro_pet_page.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_pet/cadastro_pet_store.dart';

class CadastroPetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CadastroPetStore(
          petRepository: Modular.get(),
          authController: Modular.get(),
          homeStory: Modular.get(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => CadastroPetPage(
        authController: Modular.get(),
        petModel: args.data,
      ),
    ),
  ];
}
