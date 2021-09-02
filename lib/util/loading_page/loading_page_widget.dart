import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({Key? key, required this.store}) : super(key: key);

  final store;

  @override
  _LoadingPageWidgetState createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: IgnorePointer(
          ignoring: widget.store.isLoading,
          child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            color: widget.store.isLoading
                ? Colors.black.withOpacity(.90)
                : Colors.transparent,
            child: Center(
              child: widget.store.isLoading
                  ? Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              IconConstant.categoryDog,
                              color: SweetPetColors.secundary500,
                              width: 60.0,
                              height: 60.0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              IconConstant.categoryCat,
                              color: SweetPetColors.secundary500,
                              width: 60.0,
                              height: 60.0,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Entrando. Aguarde ...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: SweetPetColors.white),
                        )
                      ],
                    )
                  : SizedBox(),
            ),
          ),
        ));
  }
}
