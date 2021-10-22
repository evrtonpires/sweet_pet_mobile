import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/pet/pet_model.dart';
import 'package:sweet_pet_mobile/util/alert_awesome/alert_awesome_widget.dart';
import 'package:sweet_pet_mobile/util/constants/base_url.dart';

import '../auth_controller.dart';

class PetRepository {
  final Dio dio;

  PetRepository({required this.dio}) {
    dio.options.receiveTimeout = 36000;
  }

//----------------------------------------------------------------------------
  Future<PetModel?> setPet({
    required PetModel petModel,
    required AuthController authController,
    context,
  }) async {
    try {
      Response response = await dio
          .post('${BaseUrl.baseUrl}/Pet',
              data: petModel,
              options: Options(
                headers: {
                  "Authorization": "Bearer ${authController.token}",
                },
              ))
          .catchError((e) {
        AwesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            text: e.response.data['messages'][0]['message'],
            title: e.response.data['title'],
            borderColor: Colors.red,
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
      });
      return PetModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

//----------------------------------------------------------------------------

  Future<List<PetModel>> getPets({
    required AuthController authController,
    context,
  }) async {
    try {
      Response response = await dio
          .get('${BaseUrl.baseUrl}/Pet/ByUser/${authController.userModel!.id}',
              options: Options(
                headers: {
                  "Authorization": "Bearer ${authController.token}",
                },
              ))
          .catchError((e) {
        AwesomeDialogWidget(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            text: e.response.data['messages'][0]['message'],
            title: e.response.data['title'],
            borderColor: Colors.red,
            buttonColor: Colors.red.shade800,
            btnOkOnPress: () {});
      });

      List<PetModel> pets = [];
      pets = response.data.map<PetModel>((pet) {
        return PetModel.fromJson(pet);
      }).toList();
      return pets;
    } catch (e) {
      print(e);
      return [];
    }
  }

//----------------------------------------------------------------------------

}
