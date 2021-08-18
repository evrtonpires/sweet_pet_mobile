// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    Id: json['Id'] as int,
    Name: json['Name'] as String,
    Email: json['Email'] as String,
    Password: json['Password'] as String,
    CPF: json['CPF'] as String,
    eType: _$enumDecode(_$eTypeUserEnumMap, json['eType']),
    CRMV: json['CRMV'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Email': instance.Email,
      'Password': instance.Password,
      'CPF': instance.CPF,
      'eType': _$eTypeUserEnumMap[instance.eType],
      'CRMV': instance.CRMV,
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

const _$eTypeUserEnumMap = {
  eTypeUser.DEVEPOLER: 'DEVEPOLER',
  eTypeUser.USER: 'USER',
  eTypeUser.VETERINARIAN: 'VETERINARIAN',
};
