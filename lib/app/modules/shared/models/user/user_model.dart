import 'package:json_annotation/json_annotation.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  late int id;
  late String name;
  late String email;
  late String? password;
  late eTypeUser eType;
  late String? crmv;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.password,
      required this.eType,
      required this.crmv});

  UserModel.padrao();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
