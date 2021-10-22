import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sweet_pet_mobile/app/modules/home/home_store.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/pet_repository/pet_repository.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/pet/pet_model.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/app/modules/shared/sembast/login/user_sembast.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';

part 'cadastro_pet_store.g.dart';

class CadastroPetStore = _CadastroPetStoreBase with _$CadastroPetStore;

abstract class _CadastroPetStoreBase with Store {
  _CadastroPetStoreBase(
      {required this.authController,
      required this.petRepository,
      required this.homeStory}) {
    focusName = FocusNode();
    focusBirthday = FocusNode();
    focusBreed = FocusNode();
    focusWeight = FocusNode();
  }

  final AuthController authController;
  final HomeStore homeStory;
  final PetRepository petRepository;

  //----------------------------------------------------------------------------

  late final FocusNode focusName;
  late final FocusNode focusBirthday;
  late final FocusNode focusBreed;
  late final FocusNode focusWeight;

  @observable
  bool isLoading = false;

  //----------------------------------------------------------------------------
  @observable
  String? name;

  @action
  void setName(String newName) => name = newName;

  @observable
  String? messageNameError;

  bool nameValidate(BuildContext context, {bool requestFocus = false}) {
    messageNameError = null;
    if (name == null || name!.isEmpty) {
      messageNameError = 'Campo obrigatório';
      if (requestFocus) {
        focusName.requestFocus();
      }
      return false;
    }
    return true;
  }

//----------------------------------------------------------------------------
  @observable
  DateTime? birthday;

  @action
  Function(DateTime?)? setBirthday(newBirthday) {
    birthday = newBirthday;
  }

  @observable
  String? messageBirthdayError;

  bool birthdayValidate(BuildContext context, {bool requestFocus = false}) {
    messageBirthdayError = null;
    if (birthday == null || birthday!.toIso8601String().isEmpty) {
      messageBirthdayError = 'Campo obrigatório';
      if (requestFocus) {
        focusBirthday.requestFocus();
      }
      return false;
    }
    return true;
  }

//----------------------------------------------------------------------------
  @observable
  String? breed;

  @action
  void setBreed(String newBreed) => breed = newBreed;

  @observable
  String? messageBreedError;

  bool breedValidate(BuildContext context, {bool requestFocus = false}) {
    messageBreedError = null;
    if (breed == null || breed!.isEmpty) {
      messageBreedError = 'Campo obrigatório';
      if (requestFocus) {
        focusBreed.requestFocus();
      }
      return false;
    }
    return true;
  }

//----------------------------------------------------------------------------
  @observable
  String? weight;

  @action
  void setWeight(String newWeight) => weight = newWeight;

  @observable
  String? messageWeightError;

  bool weightValidate(BuildContext context, {bool requestFocus = false}) {
    messageWeightError = null;
    if (weight == null || weight!.isEmpty) {
      messageWeightError = 'Campo obrigatório';
      if (requestFocus) {
        focusWeight.requestFocus();
      }
      return false;
    }
    return true;
  }

//----------------------------------------------------------------------------
  @observable
  eSpecie specie = eSpecie.CANINE;

  @action
  void setSpecie(eSpecie newSpecie) => specie = newSpecie;

//----------------------------------------------------------------------------
  @observable
  eGender gender = eGender.MALE;

  @action
  void setGender(eGender newGender) => gender = newGender;

//----------------------------------------------------------------------------
  @action
  Future<void> autenticate(BuildContext context) async {
    if (!nameValidate(context, requestFocus: true)) {
      return;
    }
    if (!birthdayValidate(context, requestFocus: true)) {
      return;
    }
    if (!breedValidate(context, requestFocus: true)) {
      return;
    }
    if (!weightValidate(context, requestFocus: true)) {
      return;
    }
    if (messageNameError == null &&
        messageBirthdayError == null &&
        messageBreedError == null &&
        messageWeightError == null &&
        !isLoading) {
      await setPet(context: context);
    }
  }

//----------------------------------------------------------------------------
  @action
  Future<bool?> setPet({
    required context,
  }) async {
    try {
      var connectivityResult = await authController.checkConnectivity();

      UserSembast userSembast = UserSembast();

      PetModel? petModel;
      PetModel petModelMockUp = PetModel(
          id: null,
          name: name!,
          birthday: birthday!.toIso8601String().substring(0, 10),
          eSpecie: specie.index,
          breed: breed!,
          eGender: gender.index,
          weight: double.parse(weight!),
          userId: authController.userModel!.id!);

      if (connectivityResult) {
        petModel = await petRepository.setPet(
            petModel: petModelMockUp,
            context: context,
            authController: authController);
        if (petModel != null) {
          List<PetModel> listPets = [];
          UserModel? uModel = await userSembast.get(authController.userModel!);
          if (uModel != null) {
            if (uModel.pets == null) {
              uModel.pets = [];
            }
            uModel.pets?.add(petModel);
            await userSembast.insert(uModel);
            listPets =
                await petRepository.getPets(authController: authController);

            authController.userModel!.pets = listPets;
            authController.userModel = authController.userModel;
            homeStory.pet = authController.userModel!.pets![0];
            Modular.to.pop();
          }

          return true;
        } else {
          return false;
        }
      } else {}
    } catch (e) {
      print(e);

      return false;
    }
  }
}
