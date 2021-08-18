import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/category/category_model.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/style.dart';

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
            border: Border.all(
              color: SweetPetColors.blueLight.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        elevation: 1,
      ),
      borderRadius: BorderRadius.circular(15),
      onTap: () {},
    );
  }
}
