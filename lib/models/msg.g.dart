// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      isSender: json['isSender'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'],
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'message': instance.message,
      'timestamp': instance.timestamp,
      'isSender': instance.isSender,
    };
