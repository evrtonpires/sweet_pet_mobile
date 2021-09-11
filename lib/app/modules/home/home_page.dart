import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'home_store.dart';
import 'widgets/flip_card_custom.dart';
import 'widgets/list_view_card_info_pet.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final pageViewCardAnimalController = PageController(keepPage: true);
  final pageViewItensAnimalController = PageController(keepPage: true);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetPetColors.white,
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .35,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .23,
                      width: MediaQuery.of(context).size.width - 20,
                      child: FlipCardCustom(),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .12,
                      child: ListViewCardInfoPet(
                        store: store,
                        pageViewController:
                            widget.pageViewItensAnimalController,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: widget.pageViewItensAnimalController,
                    onPageChanged: (id) {
                      store.setCurrentTabItensAnimal(id);
                    },
                    children: [
                      Container(
                        color: SweetPetColors.LARANJASGS.withOpacity(.15),
                      ),
                      Container(
                        color: Colors.blue,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                      Container(
                        color: Colors.pinkAccent,
                      ),
                      Container(
                        color: Colors.orange,
                      ),
                      Container(
                        color: Colors.grey,
                      ),
                    ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
