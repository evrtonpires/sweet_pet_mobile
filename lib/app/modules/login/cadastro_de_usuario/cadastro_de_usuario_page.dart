import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/app/modules/login/cadastro_de_usuario/cadastro_de_usuario_store.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/loading_page/loading_page_widget.dart';
import 'package:sweet_pet_mobile/util/no_connection/no_connection_widget.dart';
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
  late TextEditingController emailConfirmationController;

  late TextEditingController passwordController;

  late TextEditingController passwordControllerConfirmation;

  late TextEditingController crmvController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    emailConfirmationController = TextEditingController();
    passwordController = TextEditingController();
    passwordControllerConfirmation = TextEditingController();
    crmvController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    emailConfirmationController.dispose();
    passwordController.dispose();
    passwordControllerConfirmation.dispose();
    crmvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return widget.authController.isEnableConnecticonnectivity
          ? Stack(
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
                              size: 30,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.88),
                          child: Text(
                            'Cadastro',
                            style: GoogleFonts.sriracha(
                              color: Colors.white,
                              fontSize:
                                  getValueFont(context: context, valueMin: 24),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .1,
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
                                          textInputAction: TextInputAction.next,
                                          messageError: store.messageNameError,
                                          onValidator: () =>
                                              store.nameValidate(context),
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      store.focusEmail),
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
                                          textInputAction: TextInputAction.next,
                                          messageError: store.messageEmailError,
                                          onValidator: () =>
                                              store.emailValidate(context),
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .requestFocus(store
                                                      .focusEmailConfirmation),
                                          isPassword: false,
                                        );
                                      },
                                    ),
                                  ),
                                  PaddingWithObserverWidget(
                                    child: Observer(
                                      builder: (_) {
                                        return TextFieldWithValidationWidget(
                                          controller:
                                              emailConfirmationController,
                                          focusNode:
                                              store.focusEmailConfirmation,
                                          placeholder: 'Confirmacao de Email',
                                          onChanged: (newEmailConfirmation) {
                                            store.setEmailConfirmation(
                                                newEmailConfirmation);
                                            store.emailConfirmationValidate(
                                                context);
                                          },
                                          textInputAction: TextInputAction.next,
                                          messageError: store
                                              .messageEmailConfirmationError,
                                          onValidator: () =>
                                              store.emailConfirmationValidate(
                                                  context),
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      store.focusPassword),
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
                                          textInputAction: TextInputAction.next,
                                          messageError:
                                              store.messagePasswordError,
                                          onValidator: () =>
                                              store.passwordValidate(context),
                                          onEditingComplete: () => FocusScope
                                                  .of(context)
                                              .requestFocus(store
                                                  .focusPasswordConfirmation),
                                          isPassword: true,
                                        );
                                      },
                                    ),
                                  ),
                                  PaddingWithObserverWidget(
                                    child: Observer(
                                      builder: (_) {
                                        return TextFieldWithValidationWidget(
                                          controller:
                                              passwordControllerConfirmation,
                                          focusNode:
                                              store.focusPasswordConfirmation,
                                          placeholder: 'Confirmacao de Senha',
                                          onChanged: (newPasswordConfirmation) {
                                            store.setPasswordConfirmation(
                                                newPasswordConfirmation);
                                            store.passwordConfirmationValidate(
                                                context);
                                          },
                                          textInputAction:
                                              store.intETypeUser == 1
                                                  ? TextInputAction.done
                                                  : TextInputAction.next,
                                          messageError: store
                                              .messagePasswordConfirmationError,
                                          onValidator: () => store
                                              .passwordConfirmationValidate(
                                                  context),
                                          onEditingComplete: store
                                                      .intETypeUser ==
                                                  1
                                              ? () => store.autenticate(context)
                                              : () => FocusScope.of(context)
                                                  .requestFocus(store
                                                      .focusPasswordConfirmation),
                                          isPassword: true,
                                        );
                                      },
                                    ),
                                  ),
                                  PaddingWithObserverWidget(
                                    bottom: 0,
                                    child: Observer(
                                      builder: (context) {
                                        return store.intETypeUser != 1
                                            ? TextFieldWithValidationWidget(
                                                controller: crmvController,
                                                focusNode: store.focusCRMV,
                                                placeholder: 'CRMV',
                                                onChanged: (newCRMV) {
                                                  store.setCRMV(newCRMV);
                                                  store.crmvValidate(context);
                                                },
                                                textInputAction:
                                                    TextInputAction.done,
                                                messageError:
                                                    store.messageCRMVError,
                                                onValidator: () =>
                                                    store.crmvValidate(context),
                                                onEditingComplete: () =>
                                                    store.autenticate(context),
                                                isPassword: false,
                                              )
                                            : SizedBox();
                                      },
                                    ),
                                  ),
                                  PaddingWithObserverWidget(
                                    top: 0,
                                    left:
                                        MediaQuery.of(context).size.width * .15,
                                    right:
                                        MediaQuery.of(context).size.width * .15,
                                    bottom: 0,
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
                                                  groupValue:
                                                      store.intETypeUser,
                                                  onChanged: (v) {
                                                    store.setUserOrCRMV(
                                                        v as int);
                                                  },
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('Veterinário'),
                                                Radio(
                                                  value: 2,
                                                  groupValue:
                                                      store.intETypeUser,
                                                  onChanged: (v) {
                                                    store.setUserOrCRMV(
                                                        v as int);
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
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      top: MediaQuery.of(context).size.width *
                                          .1,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        store.autenticate(context);
                                      },
                                      child: Container(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9B233),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Cadastrar'.toUpperCase(),
                                            style: GoogleFonts.sriracha(
                                              color: SweetPetColors.purple,
                                              fontWeight: FontWeight.bold,
                                            ),
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
            )
          : NoConnectionWidget();
    });
  }
}
