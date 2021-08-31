import 'package:flutter/material.dart';

class AnimalCardInformationImagePetWidget extends StatelessWidget {
  const AnimalCardInformationImagePetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.height * .2,
    );
  }
}
