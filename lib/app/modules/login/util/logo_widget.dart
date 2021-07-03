import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  final String title;

  const LogoWidget({Key? key, this.title = "LogoWidgetWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'S',
            style: GoogleFonts.pacifico(
                color: Color(0xffe46b10),
//                color: Colors.lightBlueAccent,
                fontSize: MediaQuery.of(context).size.height * .05),
            children: [
              TextSpan(text: 'wee', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 't',
                  style: TextStyle(color: Color(0xffe46b10)
//                    color: Colors.lightBlueAccent
                      )),
            ]),
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Pet',
            style: GoogleFonts.pacifico(
//                            color: Color(0xffe46b10),
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * .04)),
      )
    ]);
  }
}
