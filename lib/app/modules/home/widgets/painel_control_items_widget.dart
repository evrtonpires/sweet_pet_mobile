import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';

class PainelControlItemsWidget extends StatelessWidget {
  const PainelControlItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: SweetPetColors.primary800,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      margin: EdgeInsets.all(10),
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 1,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          highlightColor: SweetPetColors.primary800,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: SvgPicture.asset(
                  IconConstant.categoryDog,
                  color: SweetPetColors.primary800,
                ),
                height: MediaQuery.of(context).size.height * .09,
                width: MediaQuery.of(context).size.width * .3,
              ),
              Text(
                'Medicamentos',
                style: GoogleFonts.sriracha(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
