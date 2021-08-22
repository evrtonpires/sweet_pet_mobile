import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';

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
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: SweetPetColors.purple,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(IconConstant.iconDogPaw),
                    ),
                  ),
                ),
                Text('${userModel.name}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
