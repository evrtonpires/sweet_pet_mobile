import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sweet_pet_mobile/app/modules/home/home_store.dart';
import 'package:sweet_pet_mobile/app/modules/shared/auth/auth_controller.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';
import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';

class ChangePet extends StatefulWidget {
  const ChangePet({Key? key, required this.homeStore}) : super(key: key);

  final HomeStore homeStore;

  @override
  State<ChangePet> createState() => _ChangePetState();
}

class _ChangePetState extends State<ChangePet> {
  List<String> listName = [];

  final AuthController _authController = Modular.get();

  void createList() async {
    widget.homeStore.changeIsLoading();
    await List.generate(widget.homeStore.user.pets!.length, (index) async {
      final String? path = await _authController.getUserSharedPref(
          stringValue: widget.homeStore.user.pets![index].name);
      if (path != null) {
        setState(() {
          listName.add(path);
        });
      }
    });
    widget.homeStore.changeIsLoading();
  }

  @override
  void initState() {
    createList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: SweetPetColors.white,
            child: GridView.builder(
              itemCount: widget.homeStore.user.pets!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    widget.homeStore.pet = widget.homeStore.user.pets![index];
                    widget.homeStore.changeNamedPet =
                        widget.homeStore.user.pets![index].name;
                    widget.homeStore.img = null;

                    final String? imgPath =
                        await widget.homeStore.authController.getUserSharedPref(
                            stringValue: widget.homeStore.pet!.name);

                    if (imgPath != null && imgPath.isNotEmpty) {
                      widget.homeStore.img = imgPath;
                    } else {
                      widget.homeStore.img = null;
                    }

                    Modular.to.pop();
                  },
                  child: widget.homeStore.isLoading == false
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .21,
                              width: MediaQuery.of(context).size.width * .45,
                              decoration: BoxDecoration(
                                color: widget.homeStore.user.pets![index]
                                            .eSpecie ==
                                        1
                                    ? Color(0xFF8379C1)
                                    : Color(0xFFEA566A),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  scale: .1,
                                  fit: BoxFit.cover,
                                  image: listName[index].isNotEmpty
                                      ? FileImage(File(listName[index]))
                                      : AssetImage(
                                          widget.homeStore.user.pets![index]
                                                      .eSpecie ==
                                                  1
                                              ? IconConstant.dogDefault
                                              : IconConstant.catDefault,
                                        ) as ImageProvider,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(.9, -.9),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: SweetPetColors.white,
                                            shape: BoxShape.circle),
                                        child: InkWell(
                                          onTap: () {
                                            Modular.to.pushNamed('/home/cadpet',
                                                arguments: widget.homeStore.user
                                                    .pets![index]);
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: SweetPetColors.primary800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(widget.homeStore.user.pets![index].name),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
