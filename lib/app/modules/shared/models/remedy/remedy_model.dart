import 'package:json_annotation/json_annotation.dart';

part 'remedy_model.g.dart';

@JsonSerializable()
class RemedyModel {
  late int Id;

  RemedyModel({
    required this.Id,
  });

  RemedyModel.padrao();

  factory RemedyModel.fromJson(Map<String, dynamic> json) =>
      _$RemedyModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemedyModelToJson(this);
}
