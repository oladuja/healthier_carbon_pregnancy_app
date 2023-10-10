import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/models/user.dart';

class CreateNewUser extends ChangeNotifier {
  User user = User(
    id: auth.currentUser?.uid ?? '',
    name: '',
    email: '',
    stage: '',
    dob: Timestamp.now(),
    height: '',
    weight: '',
    healthCondition: '',
    period: Timestamp.now(),
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

  void setdob(Timestamp dob) {
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

  void setPeriod(Timestamp period) {
    user.period = period;
  }

  void setProfile(Map<String, dynamic> json) {
    user = User.fromJson(json);
  }
}
