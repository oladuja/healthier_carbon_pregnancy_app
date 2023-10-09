// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      stage: json['stage'] as String,
      dob: json['dob'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      healthCondition: json['healthCondition'] as String,
      period: json['period'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'stage': instance.stage,
      'dob': instance.dob,
      'height': instance.height,
      'weight': instance.weight,
      'healthCondition': instance.healthCondition,
      'period': instance.period,
    };
