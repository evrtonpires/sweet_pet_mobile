// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int?,
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String?,
    eType: json['eType'] as int,
    crmv: json['crmv'] as String?,
    pets: (json['pets'] as List<dynamic>?)
        ?.map((e) => PetModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'eType': instance.eType,
      'crmv': instance.crmv,
      'pets': instance.pets,
    };
