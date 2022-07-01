// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      password: json['password'] as String,
      image: json['image'] as String?,
    )
      ..id = json['id'] as int?
      ..balance = json['balance'] as int?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'image': instance.image,
      'id': instance.id,
      'balance': instance.balance,
    };
