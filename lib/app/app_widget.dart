import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/util/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweet Pet - Controle de Animais Domésticos',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
