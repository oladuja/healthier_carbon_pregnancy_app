import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String email;
  String stage;
  String height;
  String weight;
  String healthCondition;
  @TimestampConverter()
  Timestamp period;
  @TimestampConverter()
  Timestamp dob;
  String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.stage,
    required this.dob,
    required this.height,
    required this.weight,
    required this.healthCondition,
    required this.period,
    this.imageUrl =
        'https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class TimestampConverter implements JsonConverter<Timestamp, Timestamp?> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp? json) => json ?? Timestamp.now();

  @override
  Timestamp? toJson(Timestamp json) => json;
}
