import 'dart:ui';

abstract class SweetPetColors {
  static const Color orange = Color(0xFFf45d27);
  static const Color orangeLight = Color(0xFFf5851f);
  static const Color blue = Color(0xFF4A62C9);
  static const Color lightBlue = Color(0xFF4A62C9);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFF404040);
  static const Color grayLighter = Color(0xFFEAEAEA);
  static const Color grayLight = Color(0xFFC0C0C0);

  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutralGray = Color(0xFF909090);

  static const Color successLight = Color(0xFF51E572);
  static const Color success = Color(0xFF51E572);

  static Color scrollBarColor = orange.withOpacity(0.8);
  static const Color error = Color(0xFFF74237);

  static List<Color> linearGradient = [Color(0xFFf45d27), Color(0xFFf5851f)];
}
