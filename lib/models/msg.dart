import 'package:json_annotation/json_annotation.dart';

part 'msg.g.dart';

@JsonSerializable()
class Message {
  final String message;
  final dynamic timestamp;
  final String isSender;

  Message({
    required this.isSender,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
