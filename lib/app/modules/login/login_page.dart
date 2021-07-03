import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/login/login_store.dart';
import 'package:sweet_pet_mobile/app/modules/login/util/logo_widget.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';
import 'package:sweet_pet_mobile/util/widgets/text_field_widget.dart';

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

  @override
  void initState() {
    super.initState();

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
              animation: animationController,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: LogoWidget()),
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, animationLogo.value),
                  child: Opacity(
                    opacity: animationLogoOpacidade.value,
                    child: child,
                  ),
                );
              },
            ),
            AnimatedBuilder(
                animation: animationController,
                child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Column(
                        children: [
                          TextFieldWidget(
                            hint: "Usuário",
                            isHint: true,
                            textInputType: TextInputType.emailAddress,
                            campoObrigatorio: false,
                            isFilled: true,
                            isLoginPage: true,
                            iconPrefixo: Icons.email,
                            fontSizehint: getValueFont(
                                context: context, valueMin: 20, valueMax: 22),
                          ),
                          TextFieldWidget(
                            hint: "Senha",
                            isHint: true,
                            textInputType: TextInputType.emailAddress,
                            campoObrigatorio: false,
                            isFilled: true,
                            isLoginPage: true,
                            iconPrefixo: Icons.lock_open_sharp,
                            possuiMaxLines: false,
                            obscureText: true,
                            isPassword: true,
                            maxNumberLines: 1,
                            fontSizehint: getValueFont(
                                context: context, valueMin: 20, valueMax: 22),
                          ),
                        ],
                      ),
                    )),
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, animationBtnEntrar.value),
                    child: Opacity(
                      opacity: animationBtnEntrarOpacidade.value,
                      child: child,
                    ),
                  );
                })
          ],
        )),
      )),
    ));
  }
}
