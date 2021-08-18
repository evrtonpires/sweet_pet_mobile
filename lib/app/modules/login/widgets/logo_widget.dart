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
            text: 'Evol',
            style: GoogleFonts.pacifico(
                color: Colors.black54,
                fontSize: MediaQuery.of(context).size.height * .05),
            children: [
              TextSpan(
                  text: '2',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, .7))),
              TextSpan(text: 'SP', style: TextStyle(color: Colors.black54))
            ]),
      ),
//       RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//             text: 'Pet',
//             style: GoogleFonts.pacifico(
// //                            color: Color(0xffe46b10),
//                 color: Colors.black,
//                 fontSize: MediaQuery.of(context).size.height * .04)),
//       )
    ]);
  }
}
