// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transctions _$TransctionsFromJson(Map<String, dynamic> json) => Transctions(
      id: json['id'] as int?,
      payerId: json['payerId'] as int,
      receiverId: json['receiverId'] as int,
      amount: json['amount'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TransctionsToJson(Transctions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payerId': instance.payerId,
      'receiverId': instance.receiverId,
      'amount': instance.amount,
      'type': instance.type,
    };
