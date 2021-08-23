import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/util/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweet Pet - Controle de Animais Domésticos',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            useCountryCode: false,
            fallbackFile: 'pt',
            basePath: 'assets/i18n',
            forcedLocale: Locale('pt'),
          ),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'), // Português
        const Locale('en'), // English
        const Locale('es'), // Spanish
      ],
    ).modular();
  }
}
