// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String?,
    eType: _$enumDecode(_$eTypeUserEnumMap, json['eType']),
    crmv: json['crmv'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'eType': _$eTypeUserEnumMap[instance.eType],
      'crmv': instance.crmv,
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
  eTypeUser.DEVEPOLER: 7584,
  eTypeUser.USER: 1,
  eTypeUser.VETERINARIAN: 2,
};
