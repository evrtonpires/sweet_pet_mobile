import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/dashboard/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/dashboard/widgets/user_dialog_card_widget.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/homeDashboard_page.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/constants/style.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

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
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: RichText(
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(
                fontSize: getValueFont(context: context, valueMin: 12),
              ),
              children: [
                TextSpan(
                  text: 'Olá, ${widget.authController.userModel!.name}',
                  style: styleFontIconBottomNavigation,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            decoration: BoxDecoration(
              color: SweetPetColors.primary800,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage(IconConstant.iconDogPaw),
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return UserDialogCard(
                        userModel: widget.authController.userModel!,
                      );
                    });
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 5),
            color: SweetPetColors.primary800,
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
          HomeDashboardPage(),
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
              backgroundColor: Colors.white,
              currentIndex: store.currentTab,
              selectedColor: SweetPetColors.primary500,
              strokeColor: SweetPetColors.primary500,
              unSelectedColor: SweetPetColors.gray,
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
