import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/widgets/size_font.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.authController}) : super(key: key);

  final AuthController? authController;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    store.getUser();
    store.getPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SweetPetColors.grey100,
      body: Observer(
        builder: (_) {
          return store.pet != null
              ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            store.pet!.eSpecie == 1
                                ? IconConstant.dogBg
                                : IconConstant.catBg,
                          ),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * .4,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(.9, -.85),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Modular.to.pushReplacementNamed('/');
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    color: SweetPetColors.white,
                                  ),
                                ),
                                PopupMenuButton(
                                  icon: Icon(Icons.menu,
                                      color: SweetPetColors.white),
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        onTap: () {
                                          Modular.to.pushNamed('/home/cadpet');
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.add_circle,
                                            size: 25,
                                          ),
                                          title: Text('Adicionar Pet'),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {
                                          Modular.to
                                              .pushNamed('/home/changePet');
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.workspaces_filled,
                                            size: 25,
                                          ),
                                          title: Text('Pets'),
                                        ),
                                      ),
                                    ];
                                  },
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -.1),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        color: SweetPetColors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width * .9,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .06),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${store.pet!.name}',
                                              style: GoogleFonts.capriola(
                                                letterSpacing: 3,
                                                fontSize: getValueFont(
                                                    context: context,
                                                    valueMin: 20),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            SvgPicture.asset(
                                                store.pet!.eGender == 1
                                                    ? IconConstant.iconMaleSvg
                                                    : IconConstant
                                                        .iconFemaleSvg,
                                                height: 25),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment(-.9, .0),
                                child: iconText(
                                    icon: IconConstant.iconBirth,
                                    title: 'Nascimento',
                                    valueData:
                                        '${store.pet!.birthday.substring(0, 10)}'),
                              ),
                              Align(
                                alignment: Alignment(-.9, .5),
                                child: iconText(
                                    icon: store.pet!.eSpecie == 1
                                        ? IconConstant.iconDog
                                        : IconConstant.iconCat,
                                    title: 'Espécie',
                                    valueData: store.pet!.eSpecie == 1
                                        ? 'Canino'
                                        : 'Felino'),
                              ),
                              Align(
                                alignment: Alignment(.9, .0),
                                child: iconText(
                                    icon: IconConstant.iconWeigth,
                                    title: 'Peso',
                                    valueData: '${store.pet!.weight}'),
                              ),
                              Align(
                                alignment: Alignment(.9, .5),
                                child: iconText(
                                    icon: IconConstant.dogAndCat,
                                    title: 'Raça',
                                    valueData: store.pet!.breed),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: SweetPetColors.grey100,
                        height: MediaQuery.of(context).size.height * .375,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: store.activityPet.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (_, index) {
                              return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: SweetPetColors.white,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .07,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .07,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                store.activityPet[index].icon),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(store.activityPet[index].title),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -.48),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * .15,
                          backgroundImage: store.img == null
                              ? store.pet!.eSpecie == 1
                                  ? AssetImage(
                                      IconConstant.dogDefault,
                                    )
                                  : AssetImage(
                                      IconConstant.catDefault,
                                    )
                              : FileImage(File(store.img!)) as ImageProvider,
                        ),
                        onTap: store.setImg,
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: SvgPicture.asset(
                        IconConstant.backgroundSvgFirstPet,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(.9, -.85),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Modular.to.pushReplacementNamed('/');
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    color:
                                        store.authController.userModel!.pets !=
                                                    null &&
                                                store.authController.userModel!
                                                    .pets!.isNotEmpty
                                            ? SweetPetColors.white
                                            : Colors.black,
                                  ),
                                ),
                                PopupMenuButton(
                                  icon: Icon(Icons.menu,
                                      color: store.authController.userModel!
                                                      .pets !=
                                                  null &&
                                              store.authController.userModel!
                                                  .pets!.isNotEmpty
                                          ? SweetPetColors.white
                                          : Colors.black),
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        onTap: () {
                                          Modular.to.pushNamed('/home/cadpet');
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.add_circle,
                                            size: 25,
                                          ),
                                          title: Text('Adicionar Pet'),
                                        ),
                                      ),
                                    ];
                                  },
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Seja Bem Vindo ${store.authController.userModel!.name}',
                            style: GoogleFonts.sriracha(
                              fontSize:
                                  getValueFont(context: context, valueMin: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Adicione seu primeiro Pet',
                            style: GoogleFonts.sriracha(
                              fontSize:
                                  getValueFont(context: context, valueMin: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Modular.to.pushNamed('/home/cadpet');
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: SweetPetColors.orange,
                              ),
                              child: Icon(
                                Icons.add,
                                color: SweetPetColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget iconText({
    required String icon,
    required String title,
    String? valueData,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * .07,
          width: MediaQuery.of(context).size.width * .07,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(icon),
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.capriola(
                color: SweetPetColors.grey700,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: getValueFont(context: context, valueMin: 11),
              ),
            ),
            Text(
              valueData ?? '',
              style: GoogleFonts.capriola(
                color: SweetPetColors.grey500,
                letterSpacing: 3,
                fontSize: getValueFont(context: context, valueMin: 11),
              ),
            ),
          ],
        )
      ],
    );
  }
}
