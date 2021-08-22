// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return PetModel(
    Id: json['Id'] as int,
    Name: json['Name'] as String,
    Birth: json['Birth'] as String,
    Age: json['Age'] as int,
    Birthday: json['Birthday'] as String,
    Specie: _$enumDecode(_$eSpecieEnumMap, json['Specie']),
    Breed: json['Breed'] as String,
    Gender: _$enumDecode(_$eGenderEnumMap, json['Gender']),
    Peso: (json['Peso'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Birth': instance.Birth,
      'Age': instance.Age,
      'Birthday': instance.Birthday,
      'Specie': _$eSpecieEnumMap[instance.Specie],
      'Breed': instance.Breed,
      'Gender': _$eGenderEnumMap[instance.Gender],
      'Peso': instance.Peso,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$eSpecieEnumMap = {
  eSpecie.OTHER: 'OTHER',
  eSpecie.CANINE: 'CANINE',
  eSpecie.FELINE: 'FELINE',
};

const _$eGenderEnumMap = {
  eGender.UNDEFINED: 'UNDEFINED',
  eGender.MALE: 'MALE',
  eGender.FEMALE: 'FEMALE',
};
