import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/models/user.dart';

class CreateNewUser extends ChangeNotifier {
  User user = User(
    id: auth.currentUser?.uid ?? '',
    name: '',
    email: '',
    stage: '',
    dob: '',
    height: '',
    weight: '',
    healthCondition: '',
    period: '',
  );

  void setName(String name) {
    user.name = name;
  }

  void setEmail(String email) {
    user.email = email;
  }

  void setStage(String stage) {
    user.stage = stage;
  }

  void setdob(String dob) {
    user.dob = dob;
  }

  void setHeight(String height) {
    user.height = height;
  }

  void setWeight(String weight) {
    user.weight = weight;
  }

  void setHealthCondition(String healthCondition) {
    user.healthCondition = healthCondition;
  }

  void setPeriod(String period) {
    user.period = period;
  }

  void setProfile(
    String name,
    String email,
    String stage,
    String dob,
    String height,
    String weight,
    String healthCondition,
    String period,
  ) {
    user.name = name;
    user.email = email;
    user.stage = stage;
    user.dob = dob;
    user.height = height;
    user.weight = weight;
    user.healthCondition = healthCondition;
    user.period = period;
  }
}
