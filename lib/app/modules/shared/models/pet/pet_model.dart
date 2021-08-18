import 'package:json_annotation/json_annotation.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel {
  late int Id;
  late String Name;
  late String Birth;
  late int Age;
  late String Birthday;
  late eSpecie Specie;
  late String Breed;
  late eGender Gender;
  late double Peso;

  PetModel({
    required this.Id,
    required this.Name,
    required this.Birth,
    required this.Age,
    required this.Birthday,
    required this.Specie,
    required this.Breed,
    required this.Gender,
    required this.Peso,
  });

  PetModel.padrao();

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
