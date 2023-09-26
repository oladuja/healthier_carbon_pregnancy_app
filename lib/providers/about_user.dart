import 'package:flutter/material.dart';

class AboutUser with ChangeNotifier {
  late UserCondition userCondition;

  void selectUserCondition(UserCondition condition) {
    userCondition = condition;
    notifyListeners();
  }
}

enum UserCondition {
  pregnant,
  postpartum,
}
