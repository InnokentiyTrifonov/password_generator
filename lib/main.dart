import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_generator/app/app.dart';
import 'package:password_generator/data/password_generator.dart';

Future<void> main() async {
  await Hive.initFlutter();
  const secureStorage = FlutterSecureStorage();
  var encryptionKeyString = await secureStorage.read(key: 'key');
  if (encryptionKeyString == null) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    encryptionKeyString = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(encryptionKeyString!);
    await Hive.openBox('myBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  } else {
    final encryptionKeyUint8List = base64Url.decode(encryptionKeyString);
    await Hive.openBox('myBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  }
  PasswordGenerator.initTheme();
  runApp(const PasswordManager());
}
