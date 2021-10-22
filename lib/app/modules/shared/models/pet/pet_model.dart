import 'package:json_annotation/json_annotation.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel {
  late int? id;
  late String name;
  late String birthday;
  late int eSpecie;
  late String breed;
  late int eGender;
  late double weight;
  late int userId;

  PetModel({
    required this.id,
    required this.name,
    required this.birthday,
    required this.eSpecie,
    required this.breed,
    required this.eGender,
    required this.weight,
    required this.userId,
  });

  PetModel.padrao();

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
