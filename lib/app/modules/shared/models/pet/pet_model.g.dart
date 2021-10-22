// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return PetModel(
    id: json['id'] as int?,
    name: json['name'] as String,
    birthday: json['birthday'] as String,
    eSpecie: json['eSpecie'] as int,
    breed: json['breed'] as String,
    eGender: json['eGender'] as int,
    weight: (json['weight'] as num).toDouble(),
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'eSpecie': instance.eSpecie,
      'breed': instance.breed,
      'eGender': instance.eGender,
      'weight': instance.weight,
      'userId': instance.userId,
    };
