import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              // color: SweetPetColors.white,z
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * .11,
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              SweetPetColors.primary800,
                              SweetPetColors.orange,
                            ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: SweetPetColors.white,
                      ),
                    ),
                    Column(
                      children: [Text('Informacoes')],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
