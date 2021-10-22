import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_de_usuario/widgets/padding_with_observer_widget.dart';
import 'package:sweet_pet_mobile/app/modules/cadastro_pet/cadastro_pet_store.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/pet/pet_model.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';
import 'package:sweet_pet_mobile/util/loading_page/loading_page_widget.dart';
import 'package:sweet_pet_mobile/util/no_connection/no_connection_widget.dart';
import 'package:sweet_pet_mobile/util/widgets/date_widget.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';
import 'package:sweet_pet_mobile/util/widgets/text_field_with_validation_widget.dart';

class CadastroPetPage extends StatefulWidget {
  const CadastroPetPage({
    Key? key,
    required this.authController,
    this.petModel,
  }) : super(key: key);

  final AuthController authController;
  final PetModel? petModel;

  @override
  CadastroPetPageState createState() => CadastroPetPageState();
}

class CadastroPetPageState extends State<CadastroPetPage> {
  final CadastroPetStore store = Modular.get();

  late TextEditingController nameController;
  late TextEditingController birthdayController;
  late TextEditingController breedController;
  late MoneyMaskedTextController weightController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    birthdayController = TextEditingController();
    breedController = TextEditingController();
    weightController =
        MoneyMaskedTextController(decimalSeparator: '.', precision: 2);

    if (widget.petModel != null) {
      store.isEditing = true;
      nameController.text = widget.petModel!.name;

      breedController.text = widget.petModel!.breed;
      weightController.text = widget.petModel!.weight.toString();
      store.name = widget.petModel!.name;
      store.birthday = DateTime.tryParse(widget.petModel!.birthday);
      store.breed = widget.petModel!.breed;
      store.weight = widget.petModel!.weight.toString();

      store.specie =
          widget.petModel!.eSpecie == 1 ? eSpecie.CANINE : eSpecie.FELINE;
      store.gender =
          widget.petModel!.eGender == 1 ? eGender.MALE : eGender.FEMALE;
    } else {
      store.isEditing = false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    birthdayController.dispose();
    breedController.dispose();
    weightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.authController.isEnableConnecticonnectivity) {
        return Stack(
          children: [
            Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: SweetPetColors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.95, -0.9),
                      child: IconButton(
                        onPressed: () {
                          Modular.to.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: SweetPetColors.primary800,
                          size: 30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.88),
                      child: Text(
                        'Cadastrar Pet',
                        style: GoogleFonts.sriracha(
                          color: SweetPetColors.primary800,
                          fontSize:
                              getValueFont(context: context, valueMin: 24),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .14,
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: nameController,
                                    focusNode: store.focusName,
                                    placeholder: 'Nome',
                                    onChanged: (newName) {
                                      store.setName(newName);
                                      store.nameValidate(context);
                                    },
                                    textInputAction: TextInputAction.next,
                                    messageError: store.messageNameError,
                                    onValidator: () =>
                                        store.nameValidate(context),
                                    isPassword: false,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: BasicDateField(
                                onChanged: store.setBirthday,
                                controller: birthdayController,
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: breedController,
                                    focusNode: store.focusBreed,
                                    placeholder: 'Raça',
                                    onChanged: (newBreed) {
                                      store.setBreed(newBreed);
                                      store.breedValidate(context);
                                    },
                                    textInputAction: TextInputAction.next,
                                    messageError: store.messageBreedError,
                                    onValidator: () =>
                                        store.breedValidate(context),
                                    isPassword: false,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: weightController,
                                    focusNode: store.focusWeight,
                                    placeholder: 'Peso',
                                    onChanged: (newWeight) {
                                      store.setWeight(weightController
                                          .numberValue
                                          .toString());
                                      store.weightValidate(context);
                                    },
                                    textInputAction: TextInputAction.next,
                                    maxLength: 5,
                                    messageError: store.messageWeightError,
                                    onValidator: () =>
                                        store.weightValidate(context),
                                    isPassword: false,
                                    textInputType: TextInputType.number,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              top: 0,
                              left: MediaQuery.of(context).size.width * .15,
                              right: MediaQuery.of(context).size.width * .15,
                              bottom: 0,
                              child: Observer(
                                builder: (_) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Canino',
                                            style: TextStyle(
                                                color:
                                                    SweetPetColors.primary800),
                                          ),
                                          Radio(
                                            value: eSpecie.CANINE,
                                            fillColor:
                                                MaterialStateProperty.all(store
                                                            .specie ==
                                                        eSpecie.CANINE
                                                    ? SweetPetColors.yellow
                                                    : SweetPetColors.grey500),
                                            groupValue: store.specie,
                                            onChanged: (v) {
                                              store.setSpecie(v as eSpecie);
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Felino',
                                            style: TextStyle(
                                                color:
                                                    SweetPetColors.primary800),
                                          ),
                                          Radio(
                                            value: eSpecie.FELINE,
                                            fillColor:
                                                MaterialStateProperty.all(store
                                                            .specie ==
                                                        eSpecie.FELINE
                                                    ? SweetPetColors.yellow
                                                    : SweetPetColors.grey500),
                                            groupValue: store.specie,
                                            onChanged: (v) {
                                              store.setSpecie(v as eSpecie);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              top: 0,
                              left: MediaQuery.of(context).size.width * .15,
                              right: MediaQuery.of(context).size.width * .15,
                              bottom: 0,
                              child: Observer(
                                builder: (_) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Macho',
                                            style: TextStyle(
                                                color:
                                                    SweetPetColors.primary800),
                                          ),
                                          Radio(
                                            value: eGender.MALE,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    store.gender == eGender.MALE
                                                        ? SweetPetColors.yellow
                                                        : SweetPetColors
                                                            .grey500),
                                            groupValue: store.gender,
                                            onChanged: (v) {
                                              store.setGender(v as eGender);
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Fêmea',
                                            style: TextStyle(
                                                color:
                                                    SweetPetColors.primary800),
                                          ),
                                          Radio(
                                            value: eGender.FEMALE,
                                            fillColor:
                                                MaterialStateProperty.all(store
                                                            .gender ==
                                                        eGender.FEMALE
                                                    ? SweetPetColors.yellow
                                                    : SweetPetColors.grey500),
                                            groupValue: store.gender,
                                            onChanged: (v) {
                                              store.setGender(v as eGender);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.width * .05,
                                top: MediaQuery.of(context).size.width * .1,
                              ),
                              child: InkWell(
                                onTap: () {
                                  store.autenticate(context,
                                      petModelEditing: widget.petModel);
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: SweetPetColors
                                            .linearGradientButton),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Cadastrar'.toUpperCase(),
                                      style: GoogleFonts.capriola(
                                        color: SweetPetColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height * .1,
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SvgPicture.asset(
                                  IconConstant.iconLogoTextSvg,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_) {
                return store.isLoading
                    ? LoadingPageWidget(
                        store: store,
                      )
                    : SizedBox();
              },
            ),
          ],
        );
      } else {
        return NoConnectionWidget();
      }
    });
  }
}
