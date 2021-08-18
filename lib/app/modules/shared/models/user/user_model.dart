import 'package:json_annotation/json_annotation.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  late int Id;
  late String Name;
  late String Email;
  late String Password;
  late String CPF;
  late eTypeUser eType;
  late String CRMV;

  UserModel({
    required this.Id,
    required this.Name,
    required this.Email,
    required this.Password,
    required this.CPF,
    required this.eType,
    required this.CRMV,
  });

  UserModel.padrao();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
