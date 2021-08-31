import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/widgets/text_data_information_style.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

class AnimalCardInformationDataWidget extends StatelessWidget {
  const AnimalCardInformationDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: MediaQuery.of(context).size.height * .01,
              ),
              child: TextDataInformation(
                text: 'Luna',
                style: GoogleFonts.capriola(
                  fontSize: getValueFont(
                    context: context,
                    valueMin: 40,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: rowDataPetInformation(
                iconOne: Icon(
                  Icons.style,
                  color: Colors.white,
                ),
                textOne: TextDataInformation(
                  text: 'idade',
                ),
                iconTwo: Icon(
                  Icons.style,
                  color: Colors.white,
                ),
                textTwo: TextDataInformation(
                  text: 'sexo',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: rowDataPetInformation(
                iconOne: Icon(
                  Icons.style,
                  color: Colors.white,
                ),
                textOne: TextDataInformation(
                  text: 'raca',
                ),
                iconTwo: Icon(
                  Icons.style,
                  color: Colors.white,
                ),
                textTwo: TextDataInformation(
                  text: 'aniversario',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.style,
                    color: Colors.white,
                  ),
                  TextDataInformation(
                    text: 'peso',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowDataPetInformation({
    required Icon iconOne,
    required Widget textOne,
    required Icon iconTwo,
    required Widget textTwo,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            iconOne,
            textOne,
          ],
        ),
        Row(
          children: [
            iconTwo,
            textTwo,
          ],
        ),
      ],
    );
  }
}
