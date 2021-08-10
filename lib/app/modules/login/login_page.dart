import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/login/login_store.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/widgets/text_field_with_validation_widget.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(duration: Duration(milliseconds: 2000), vsync: this);

  late final Animation animationLogo = Tween<double>(begin: -50, end: 0)
      .animate(CurvedAnimation(
          parent: animationController, curve: Interval(0, 0.5)));

  late final Animation animationLogoOpacidade = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(
          parent: animationController, curve: Interval(0, 0.6)));
  late final Animation animationBtnEntrar = Tween<double>(begin: 20, end: 0)
      .animate(CurvedAnimation(
          parent: animationController, curve: Interval(0.4, 0.7)));
  late final Animation animationBtnEntrarOpacidade =
      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
          parent: animationController, curve: Interval(0.7, 1)));

  var controllerStore = LoginStore();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                        bottomRight: Radius.circular(90))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(IconConstant.iconDogPaw))),
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
                              focusNode: store.focusLogin,
                              placeholder: 'Login',
                              onChanged: (newLogin) {
                                store.setLogin(newLogin);
                                store.loginValidate(context);
                              },
                              textInputAction: TextInputAction.next,
                              messageError: store.messageLoginError,
                              onValidator: () => store.loginValidate(context),
                              onEditingComplete: () => FocusScope.of(context)
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
                            right: MediaQuery.of(context).size.width * .1),
                        child: Observer(
                          builder: (_) {
                            return Observer(
                              builder: (_) {
                                return TextFieldWithValidationWidget(
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
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16, right: 32, bottom: 50),
                        child: GestureDetector(
                          child: Text(
                            'Esqueceu sua senha ?',
                            style: TextStyle(color: Color(0xFFf45d27)),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        store.autenticate(context);
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'Entrar'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
