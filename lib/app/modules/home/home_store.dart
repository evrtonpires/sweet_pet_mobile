import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/pet_repository/pet_repository.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/pet/pet_model.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/app/modules/shared/sembast/login/user_sembast.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase({required this.authController, required this.petRepository});

  final AuthController authController;
  final PetRepository petRepository;

  final List<ActivityPet> activityPet = [
    ActivityPet(title: 'Alimentação', icon: IconConstant.alimentacao),
    ActivityPet(title: 'Consultas', icon: IconConstant.veterinario),
    ActivityPet(title: 'Higiene', icon: IconConstant.banhoETosa),
    ActivityPet(title: 'Lembretes', icon: IconConstant.lembrete),
    ActivityPet(title: 'Medicamentos', icon: IconConstant.medicamento),
    ActivityPet(title: 'Vacinas', icon: IconConstant.vacina),
  ];

//----------------------------------------------------------------------------
  @observable
  int currentTabCardAnimal = 0;

  @action
  void setCurrentTabCardAnimal(int newTab) => currentTabCardAnimal = newTab;

//----------------------------------------------------------------------------
  @observable
  int currentTabItensAnimal = 0;

  @action
  void setCurrentTabItensAnimal(int newTab) => currentTabItensAnimal = newTab;

//----------------------------------------------------------------------------
  @observable
  UserModel user = UserModel.padrao();

//----------------------------------------------------------------------------
  @observable
  PetModel? pet;

//----------------------------------------------------------------------------
  @observable
  String? img;

//----------------------------------------------------------------------------
  @observable
  bool isLoading = false;

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

//----------------------------------------------------------------------------
  @observable
  String changeNamedPet = '';

//----------------------------------------------------------------------------

  @action
  Future<dynamic> setImg() async {
    try {
      await ImagePicker()
          .pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      )
          .then((value) {
        img = value!.path;
        authController.saveUserSharedPrefs(stringValue: pet!.name, data: img);
      });
    } catch (e) {
      print(e);
    }
  }

//----------------------------------------------------------------------------

  @action
  void getUser() {
    user = authController.userModel!;
  }

//----------------------------------------------------------------------------
  @action
  Future<void> getPets() async {
    try {
      var connectivityResult = await authController.checkConnectivity();

      if (connectivityResult) {
        if (user.pets == null) user.pets = [];
        user.pets!.addAll(
            await petRepository.getPets(authController: authController));
        user = user;
        if (user.pets != null && user.pets!.isNotEmpty) {
          pet = user.pets![0];
          changeNamedPet = pet!.name;
          final String? imgPath =
              await authController.getUserSharedPref(stringValue: pet!.name);

          if (imgPath != null && imgPath.isNotEmpty) {
            img = imgPath;
          }
        }
      } else {
        UserSembast userSembast = UserSembast();

        user = (await userSembast.get(user))!;
        if (user.pets != null && user.pets!.isNotEmpty) {
          pet = user.pets![0];
          changeNamedPet = pet!.name;
          final String? imgPath =
              await authController.getUserSharedPref(stringValue: pet!.name);

          if (imgPath != null) {
            img = imgPath;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
//----------------------------------------------------------------------------
}

class ActivityPet {
  final String title;
  final String icon;

  ActivityPet({
    required this.title,
    required this.icon,
  });
}
