import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';

import 'animal_card_information_data_pet_widget.dart';
import 'animal_card_information_image_pet_widget.dart';

class AnimalCardInformationWidget extends StatelessWidget {
  const AnimalCardInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // gradient: LinearGradient(colors: SweetPetColors.linearGradient),
            color: SweetPetColors.primary800,
            border: Border.all(
              color: SweetPetColors.primary800,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              AnimalCardInformationImagePetWidget(),
              AnimalCardInformationDataWidget(),
            ],
          ),
        ),
        elevation: 3,
      ),
      borderRadius: BorderRadius.circular(15),
      onTap: () {},
    );
  }
}
