import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

class UserDialogCard extends StatelessWidget {
  const UserDialogCard({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(1, -1),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width * .15,
          height: MediaQuery.of(context).size.height * .13,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: SweetPetColors.primary800,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(IconConstant.iconDogPaw),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${userModel.name}',
                        style: GoogleFonts.sriracha(
                          fontSize:
                              getValueFont(context: context, valueMin: 18),
                        ),
                      ),
                      Text(
                        '${userModel.email}',
                        style: GoogleFonts.sriracha(
                          fontSize:
                              getValueFont(context: context, valueMin: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: SweetPetColors.primary800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
