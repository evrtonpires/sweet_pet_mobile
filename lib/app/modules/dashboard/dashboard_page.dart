import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/home/home_page.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/style.dart';

import 'dashboard_store.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key, required this.authController}) : super(key: key);

  final pageViewController = PageController(keepPage: true);
  final AuthController authController;

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: widget.pageViewController,
        onPageChanged: (id) {
          store.setCurrentTab(id);
        },
        children: [
          HomePage(authController: Modular.get()),
          Container(
            child: Center(
              child: Text('Page 2'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Page 3'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return Row(
            children: [
              IconButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                icon: Icon(
                  Icons.home_outlined,
                  color: SweetPetColors.grey900,
                  size: 30,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                icon: Icon(
                  Icons.person_outline_sharp,
                  color: SweetPetColors.grey900,
                  size: 30,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: SweetPetColors.linearGradientButton,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.add,
                    color: SweetPetColors.white,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                icon: Icon(
                  Icons.home_outlined,
                  color: SweetPetColors.grey900,
                  size: 30,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                icon: Icon(
                  Icons.person_outline_sharp,
                  color: SweetPetColors.grey900,
                  size: 30,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void changePage(int id) {
    widget.pageViewController.animateToPage(
      id,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    store.setCurrentTab(id);
  }
}
