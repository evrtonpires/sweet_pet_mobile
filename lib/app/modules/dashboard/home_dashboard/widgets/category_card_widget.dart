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
    return InkWell(
      onTap: () {},
      child: Container(
        child: Column(
          children: [
            Card(
              elevation: 6.0,
              color: SweetPetColors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                height: 80.0,
                child: Center(
                  child: SvgPicture.asset(
                    category.Icon,
                    color: Colors.white,
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
