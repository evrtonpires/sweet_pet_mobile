import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  late int? id;
  late String cpf;
  late String cellPhone;
  late int userId;

  PersonModel(
      {this.id,
      required this.cpf,
      required this.cellPhone,
      required this.userId});

  PersonModel.padrao();

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
