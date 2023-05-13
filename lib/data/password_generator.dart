import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PasswordGenerator {
  static ValueNotifier<bool> themeData = ValueNotifier<bool>(false);

  static Box box = Hive.box('myBox');

  static void initTheme() {
    if (box.get('THEME') == null) {
      PasswordGenerator.themeData.value = false;
    } else {
      loadThemeData();
    }
  }

  static void loadThemeData() {
    themeData.value = box.get('THEME');
  }

  static void uploadThemeData() {
    box.put('THEME', PasswordGenerator.themeData.value);
  }

  List data = [];

  String upperCaseLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String number = '123456789';
  String specialChars = '<>,.?/[{[}+-=(*)!@#%^&"\$';

  bool boolUCL = false;
  bool boolN = false;
  bool boolSC = false;

  String password = 'abcdefghijklmnopqrstuvwxyz';

  int passwordLenght = 0;

  String generatePassword() {
    if (boolUCL == true) {
      password = upperCaseLetter + password;
    } else {
      password = password.replaceAll('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '');
    }

    if (boolN == true) {
      password = password + number;
    } else {
      password = password.replaceAll('123456789', '');
    }

    if (boolSC == true) {
      password = password + specialChars;
    } else {
      password = password.replaceAll('<>,.?/[{[}+-=(*)!@#%^&"\$', '');
    }

    return List.generate(passwordLenght, (index) {
      final indexRandom = Random.secure().nextInt(password.length);
      return password[indexRandom];
    }).join('');
  }
}
