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
      dob: const TimestampConverter().fromJson(json['dob'] as Timestamp?),
      height: json['height'] as String,
      weight: json['weight'] as String,
      healthCondition: json['healthCondition'] as String,
      period: const TimestampConverter().fromJson(json['period'] as Timestamp?),
      imageUrl: json['imageUrl'] as String? ??
          'https://www.nicepng.com/png/full/933-9332131_profile-picture-default-png.png',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'stage': instance.stage,
      'height': instance.height,
      'weight': instance.weight,
      'healthCondition': instance.healthCondition,
      'period': const TimestampConverter().toJson(instance.period),
      'dob': const TimestampConverter().toJson(instance.dob),
      'imageUrl': instance.imageUrl,
    };
