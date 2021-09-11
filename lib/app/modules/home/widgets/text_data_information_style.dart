import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

class TextDataInformation extends StatelessWidget {
  const TextDataInformation({Key? key, required this.text, this.style})
      : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          GoogleFonts.capriola(
            color: SweetPetColors.white,
            fontSize: getValueFont(context: context, valueMin: 16),
          ),
    );
  }
}
