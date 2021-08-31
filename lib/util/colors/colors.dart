import 'dart:ui';

abstract class SweetPetColors {
  static const Color darkest = Color(0xFF003528);
  static const Color dark = Color(0xFF005843);
  static const Color medium = Color(0xFF00B086);
  static const Color light = Color(0xFF4DC8AA);
  static const Color lightest = Color(0xFF99DFCF);

  //----------------------------------------------------------------------------
  static const Color gray = Color(0xFF404040);
  static const Color grayLighter = Color(0xFFEAEAEA);
  static const Color grayLight = Color(0xFFC0C0C0);

  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutralGray = Color(0xFF909090);

  static const Color successLight = Color(0xFF51E572);
  static const Color success = Color(0xFF51E572);

  static Color scrollBarColor = darkest.withOpacity(0.8);
  static const Color error = Color(0xFFF74237);

  static List<Color> linearGradient = [darkest, medium];
}
