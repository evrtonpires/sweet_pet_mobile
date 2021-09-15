import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/home/widgets/notification_card.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'home_store.dart';
import 'widgets/card_dregade_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.authController}) : super(key: key);

  final AuthController? authController;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetPetColors.grey100,
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              CardDegradeWidget(),
              NotificationCard(),
            ],
          );
        },
      ),
    );
  }
}
