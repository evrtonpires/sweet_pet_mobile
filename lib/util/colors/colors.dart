import 'dart:ui';

abstract class SweetPetColors {
  static const Color primary800 = Color(0xFF2F2B7F);

  //----------------------------------------------------------------------------
  static const Color secundary800 = Color(0xFF7E358A);
  static const Color secundary700 = Color(0xFF7B1FA2);
  static const Color secundary600 = Color(0xFF8E24AA);
  static const Color secundary500 = Color(0xFF9C27B0);
  static const Color secundary400 = Color(0xFFAB47BC);
  static const Color secundary300 = Color(0xFFBA68C8);
  static const Color secundary200 = Color(0xFFCE93D8);
  static const Color secundary100 = Color(0xFFE1BEE7);
  static const Color secundary050 = Color(0xFFF3E5F5);

  //----------------------------------------------------------------------------
  static const Color yellow = Color(0xFFF9B233);
  static const Color white = Color(0xFFFFFFFF);

  //----------------------------------------------------------------------------
  static const Color gray = Color(0xFF404040);
  static const Color grayLighter = Color(0xFFEAEAEA);
  static const Color grayLight = Color(0xFFC0C0C0);

  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutralGray = Color(0xFF909090);

  static const Color successLight = Color(0xFF51E572);
  static const Color success = Color(0xFF51E572);

  static Color scrollBarColor = primary800.withOpacity(0.8);
  static const Color error = Color(0xFFF74237);

  static List<Color> linearGradient = [secundary500, primary800];
}
