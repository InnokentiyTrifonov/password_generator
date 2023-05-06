import 'package:flutter/material.dart';
import 'package:password_generator/data/password_generator.dart';

class MyButton extends StatelessWidget {
  final TextEditingController passController;
  final PasswordGenerator data;
  const MyButton({super.key, required this.data, required this.passController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      child: MaterialButton(
          color: Colors.amber,
          child: const Text('Generate'),
          onPressed: () {
            final password = data.generatePassword();
            passController.text = password;
          }),
    );
  }
}
