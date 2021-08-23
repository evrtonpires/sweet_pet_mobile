import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/login/login_store.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/loading_page/loading_page_widget.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';
import 'package:sweet_pet_mobile/util/widgets/text_field_with_validation_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({required this.authController});

  final AuthController authController;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore>
    with SingleTickerProviderStateMixin {
  var controllerStore = LoginStore();

  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    widget.authController
        .getUserSharedPref(stringValue: 'userValue')
        .then((value) {
      store.setLogin(value);
      loginController.text = value;
    });
    widget.authController
        .getUserSharedPref(stringValue: 'passwordValue')
        .then((value) {
      store.setPassword(value);
      senhaController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .2,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(IconConstant.iconLogo),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 62),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .1,
                                right: MediaQuery.of(context).size.width * .1),
                            child: Observer(
                              builder: (_) {
                                return TextFieldWithValidationWidget(
                                  controller: loginController,
                                  focusNode: store.focusLogin,
                                  placeholder: FlutterI18n.translate(
                                      context, 'telaLogin.usuario'),
                                  onChanged: (newLogin) {
                                    store.setLogin(newLogin);
                                    store.loginValidate(context);
                                  },
                                  textInputAction: TextInputAction.next,
                                  messageError: store.messageLoginError,
                                  onValidator: () =>
                                      store.loginValidate(context),
                                  onEditingComplete: () =>
                                      FocusScope.of(context)
                                          .requestFocus(store.focusPassword),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .1,
                              right: MediaQuery.of(context).size.width * .1,
                            ),
                            child: Column(
                              children: [
                                Observer(
                                  builder: (_) {
                                    return TextFieldWithValidationWidget(
                                      controller: senhaController,
                                      focusNode: store.focusPassword,
                                      placeholder: FlutterI18n.translate(
                                          context, 'telaLogin.senha'),
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
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16,
                                    ),
                                    child: GestureDetector(
                                      child: Text(
                                        FlutterI18n.translate(context,
                                            'telaLogin.esqueceuSuaSenha'),
                                        style: TextStyle(
                                            color: SweetPetColors.purpleLight),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.width * .0,
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
                                    gradient: LinearGradient(
                                      colors: SweetPetColors.linearGradient,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      FlutterI18n.translate(
                                              context, 'telaLogin.entrar')
                                          .toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                FlutterI18n.translate(context, 'telaLogin.ou'),
                                style: TextStyle(
                                    color: SweetPetColors.neutralGray),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Modular.to.pushReplacementNamed('/signup');
                                },
                                child: Text(
                                  FlutterI18n.translate(
                                      context, 'telaLogin.cadastrar'),
                                  style: TextStyle(
                                      color: SweetPetColors.purpleLight,
                                      fontSize: getValueFont(
                                          context: context, valueMin: 16)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
        )
      ],
    );
  }
}
