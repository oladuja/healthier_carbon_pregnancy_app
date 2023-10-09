import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String email;
  String stage;
  String dob;
  String height;
  String weight;
  String healthCondition;
  String period;

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
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
