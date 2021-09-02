import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

class PainelControlWidget extends StatelessWidget {
  const PainelControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Center(
        child: Text(
          'Painel de Controle Animal',
          style: GoogleFonts.sriracha(
            color: SweetPetColors.white,
            fontSize: getValueFont(context: context, valueMin: 16),
          ),
        ),
      ),
      height: MediaQuery.of(context).size.height * .06,
    );
  }
}
