import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/category/category_model.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/style.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({Key? key, required this.category})
      : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {},
        highlightColor: SweetPetColors.primary800.withOpacity(.2),
        child: Column(
          children: [
            Card(
              elevation: 6.0,
              color: SweetPetColors.primary800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    // gradient:
                    //     LinearGradient(colors: SweetPetColors.linearGradient),
                    color: SweetPetColors.primary800),
                width: MediaQuery.of(context).size.width * .4,
                height: 80.0,
                child: Center(
                  child: SvgPicture.asset(
                    category.Icon,
                    color: SweetPetColors.white,
                    width: 60.0,
                    height: 60.0,
                  ),
                ),
              ),
            ),
            Text(
              category.Name,
              style: styleFontIconBottomNavigation,
            ),
          ],
        ),
      ),
    );
  }
}
