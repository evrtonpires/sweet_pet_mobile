// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) {
  return PersonModel(
    id: json['id'] as int?,
    cpf: json['cpf'] as String,
    cellPhone: json['cellPhone'] as String,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cpf': instance.cpf,
      'cellPhone': instance.cellPhone,
      'userId': instance.userId,
    };
