import 'package:json_annotation/json_annotation.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/pet/pet_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  late int? id;
  late String name;
  late String email;
  late String? password;
  late int eType;
  late String? crmv;
  late List<PetModel>? pets;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    required this.eType,
    this.crmv,
    this.pets,
  });

  UserModel.padrao();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
