import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

void AwesomeDialogWidget({
  required BuildContext context,
  required AnimType animType,
  required DialogType dialogType,
  required String text,
  required String title,
  required Color buttonColor,
  required Function() btnOkOnPress,
}) {
  AwesomeDialog(
    context: context,
    animType: animType,
    dialogType: dialogType,
    title: title,
    btnOkColor: buttonColor,
    btnOkOnPress: btnOkOnPress,
    borderSide: BorderSide(color: Colors.red, width: 1),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            title,
            style: TextStyle(
                fontSize: getValueFont(context: context, valueMin: 18),
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
  )..show();
}
