import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

class CardDegradeWidget extends StatelessWidget {
  const CardDegradeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SweetPetColors.orange,
        image: DecorationImage(
          image: NetworkImage(
              'https://p2.trrsf.com/image/fget/cf/1200/675/middle/images.terra.com/2021/06/06/983869895-sonharcomcachorro.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height * .4,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    SweetPetColors.primary800.withOpacity(.7),
                    SweetPetColors.orange.withOpacity(.4),
                  ]),
            ),
            height: MediaQuery.of(context).size.height * .4,
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .395,
              width: MediaQuery.of(context).size.width * .395,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: SweetPetColors.white,
                  gradient: LinearGradient(colors: [
                    SweetPetColors.orange,
                    SweetPetColors.primary800,
                  ])),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .39,
              width: MediaQuery.of(context).size.width * .39,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'http://portaldoscaesegatos.com.br/wp-content/uploads/2017/11/smiley.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, .75),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bobby',
                  style: GoogleFonts.righteous(
                    color: SweetPetColors.white,
                    fontSize: getValueFont(context: context, valueMin: 22),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  IconConstant.iconMaleSvg,
                  color: SweetPetColors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
