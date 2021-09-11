import 'package:flutter/material.dart';
import 'package:speech_balloon/speech_balloon.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({
    Key? key,
    required this.text,
    required this.y,
    required this.height,
  }) : super(key: key);

  final String text;
  final double y;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, y),
      child: SpeechBalloon(
        nipLocation: NipLocation.bottomLeft,
        height: height,
        width: MediaQuery.of(context).size.width * .85,
        borderRadius: 10,
        offset: Offset(10, 0),
        nipHeight: 20,
        child: Center(
          child: Container(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: getValueFont(context: context, valueMin: 16)),
            ),
          ),
        ),
      ),
    );
  }
}
