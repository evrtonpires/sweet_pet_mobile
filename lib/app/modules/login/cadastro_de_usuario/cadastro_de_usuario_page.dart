import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/app/modules/login/cadastro_de_usuario/cadastro_de_usuario_store.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/loading_page/loading_page_widget.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';
import 'package:sweet_pet_mobile/util/widgets/text_field_with_validation_widget.dart';

import 'widgets/padding_with_observer_widget.dart';

class CadastroDeUsuarioPage extends StatefulWidget {
  final AuthController authController;

  const CadastroDeUsuarioPage({Key? key, required this.authController})
      : super(key: key);

  @override
  CadastroDeUsuarioPageState createState() => CadastroDeUsuarioPageState();
}

class CadastroDeUsuarioPageState
    extends ModularState<CadastroDeUsuarioPage, CadastroDeUsuarioStore> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController passwordControllerConfirmation;

  late TextEditingController crmvController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordControllerConfirmation = TextEditingController();
    crmvController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordControllerConfirmation.dispose();
    crmvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: SweetPetColors.linearGradient,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(-0.95, -0.9),
                  child: IconButton(
                    onPressed: () {
                      Modular.to.pushReplacementNamed('/');
                    },
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.88),
                  child: Text(
                    'Cadastro',
                    style: GoogleFonts.graduate(
                      color: Colors.white,
                      fontSize: getValueFont(context: context, valueMin: 22),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
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
                                    textInputAction: TextInputAction.done,
                                    messageError: store.messageNameError,
                                    onValidator: () =>
                                        store.nameValidate(context),
                                    onEditingComplete: () =>
                                        store.autenticate(context),
                                    isPassword: false,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: emailController,
                                    focusNode: store.focusEmail,
                                    placeholder: 'Email',
                                    onChanged: (newEmail) {
                                      store.setEmail(newEmail);
                                      store.emailValidate(context);
                                    },
                                    textInputAction: TextInputAction.done,
                                    messageError: store.messageEmailError,
                                    onValidator: () =>
                                        store.emailValidate(context),
                                    onEditingComplete: () =>
                                        store.autenticate(context),
                                    isPassword: false,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: passwordController,
                                    focusNode: store.focusPassword,
                                    placeholder: 'Senha',
                                    onChanged: (newPassword) {
                                      store.setPassword(newPassword);
                                      store.passwordValidate(context);
                                    },
                                    textInputAction: TextInputAction.done,
                                    messageError: store.messagePasswordError,
                                    onValidator: () =>
                                        store.passwordValidate(context),
                                    onEditingComplete: () =>
                                        store.autenticate(context),
                                    isPassword: true,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return TextFieldWithValidationWidget(
                                    controller: passwordControllerConfirmation,
                                    focusNode: store.focusPasswordConfirmation,
                                    placeholder: 'Confirmacao de Senha',
                                    onChanged: (newPasswordConfirmation) {
                                      store.setPasswordConfirmation(
                                          newPasswordConfirmation);
                                      store.passwordConfirmationValidate(
                                          context);
                                    },
                                    textInputAction: TextInputAction.done,
                                    messageError:
                                        store.messagePasswordConfirmationError,
                                    onValidator: () => store
                                        .passwordConfirmationValidate(context),
                                    onEditingComplete: () =>
                                        store.autenticate(context),
                                    isPassword: true,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (context) {
                                  return TextFieldWithValidationWidget(
                                    controller: crmvController,
                                    focusNode: store.focusCRMV,
                                    placeholder: 'CRMV',
                                    onChanged: (newCRMV) {
                                      store.setCRMV(newCRMV);
                                      store.crmvValidate(context);
                                    },
                                    textInputAction: TextInputAction.done,
                                    messageError: store.messageCRMVError,
                                    onValidator: () =>
                                        store.crmvValidate(context),
                                    onEditingComplete: () =>
                                        store.autenticate(context),
                                    isPassword: false,
                                    isEnabled:
                                        store.intETypeUser != 1 ? true : false,
                                  );
                                },
                              ),
                            ),
                            PaddingWithObserverWidget(
                              child: Observer(
                                builder: (_) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Usuário'),
                                          Radio(
                                            value: 1,
                                            groupValue: store.intETypeUser,
                                            onChanged: (v) {
                                              store.setUserOrCRMV(v as int);
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Veterinário'),
                                          Radio(
                                            value: 2,
                                            groupValue: store.intETypeUser,
                                            onChanged: (v) {
                                              store.setUserOrCRMV(v as int);
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
                                top: MediaQuery.of(context).size.width * .2,
                              ),
                              child: InkWell(
                                onTap: () {
                                  store.autenticate(context);
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF9B233),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Cadastrar'.toUpperCase(),
                                      style: TextStyle(
                                          color: SweetPetColors.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
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
  }
}
