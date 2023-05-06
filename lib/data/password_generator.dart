import 'dart:math';

class PasswordGenerator {
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
      password += upperCaseLetter;
    } else {
      password = password.replaceAll('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '');
    }

    if (boolN == true) {
      password += number;
    } else {
      password = password.replaceAll('123456789', '');
    }

    if (boolSC == true) {
      password += specialChars;
    } else {
      password = password.replaceAll('<>,.?/[{[}+-=(*)!@#%^&"\$', '');
    }

    return List.generate(passwordLenght, (index) {
      final indexRandom = Random.secure().nextInt(password.length);
      return password[indexRandom];
    }).join('');
  }
}
