import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/homeDashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/widgets/category_card_widget.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/widgets/painel_control_items_widget.dart';
import 'package:sweet_pet_mobile/app/modules/dashboard/home_dashboard/widgets/painel_control_widget.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/category/category_model.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import 'widgets/animal_card_information_widget.dart';

class HomeDashboardPage extends StatefulWidget {
  HomeDashboardPage({Key? key}) : super(key: key);

  final pageViewController = PageController(keepPage: true);

  @override
  HomeDashboardPageState createState() => HomeDashboardPageState();
}

class HomeDashboardPageState extends State<HomeDashboardPage> {
  final HomeDashboardStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .15,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .09,
                    ),
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var category = categoryList[index];
                      return CategoryCardWidget(
                        category: category,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * .47,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: widget.pageViewController,
                          onPageChanged: (id) {
                            store.setCurrentTab(id);
                          },
                          children: List.generate(
                            3,
                            (index) => AnimalCardInformationWidget(),
                          ),
                        ),
                      ),
                      PageViewDotIndicator(
                        currentItem: store.currentTab,
                        count: 3,
                        unselectedColor: SweetPetColors.gray,
                        selectedColor: SweetPetColors.blueLight,
                        size: Size(8, 8),
                        unselectedSize: Size(4, 4),
                      ),
                    ],
                  ),
                ),
                PainelControlWidget(),
                Expanded(
                  child: Container(
                    color: SweetPetColors.blue,
                    child: GridView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                      ),
                      children: List.generate(
                        7,
                        (index) => PainelControlItemsWidget(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
