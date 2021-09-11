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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.authController.userModel!.name}',
          style: GoogleFonts.sriracha(color: SweetPetColors.PRETOSGS),
        ),
        backgroundColor: SweetPetColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: SweetPetColors.PRETOSGS,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 5),
            color: SweetPetColors.PRETOSGS,
            onPressed: () {},
            icon: Icon(Icons.notifications_active_sharp),
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: widget.pageViewController,
        onPageChanged: (id) {
          store.setCurrentTab(id);
        },
        children: [
          HomePage(),
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
          return CustomNavigationBar(
              backgroundColor: SweetPetColors.PRETOSGS,
              currentIndex: store.currentTab,
              selectedColor: SweetPetColors.orange800,
              strokeColor: SweetPetColors.orange800,
              unSelectedColor: SweetPetColors.grey400,
              iconSize: 30,
              items: [
                CustomNavigationBarItem(
                  badgeCount: 2,
                  showBadge: false,
                  icon: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: styleFontIconBottomNavigation,
                  ),
                ),
                CustomNavigationBarItem(
                  badgeCount: 2,
                  showBadge: false,
                  icon: Icon(Icons.library_books),
                  title: Text(
                    'Agenda',
                    style: styleFontIconBottomNavigation,
                  ),
                ),
                CustomNavigationBarItem(
                  badgeCount: 2,
                  showBadge: false,
                  icon: Icon(Icons.adb_sharp),
                  title: Text(
                    'Veterinarios',
                    style: styleFontIconBottomNavigation,
                  ),
                ),
              ],
              onTap: (index) {
                changePage(index);
              });
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
