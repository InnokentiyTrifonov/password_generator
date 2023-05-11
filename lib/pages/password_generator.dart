import 'package:flutter/material.dart';
import 'package:password_generator/components/password_generator/login_form.dart';
import 'package:password_generator/components/password_generator/my_button.dart';
import 'package:password_generator/components/password_generator/my_slider.dart';
import 'package:password_generator/components/password_generator/name_form.dart';

import 'package:password_generator/components/password_generator/options/numbers.dart';
import 'package:password_generator/components/password_generator/options/special_chars.dart';
import 'package:password_generator/components/password_generator/options/upper_case_letter.dart';
import 'package:password_generator/components/password_generator/pass_form.dart';
import 'package:password_generator/data/password_generator.dart';

class PasswordGeneratorPage extends StatelessWidget {
  final GlobalKey<FormState> loginKey;
  final GlobalKey<FormState> nameKey;
  final GlobalKey<FormState> passKey;
  final TextEditingController logController;
  final TextEditingController nameController;
  final TextEditingController passController;
  final PasswordGenerator data;
  final VoidCallback saveInList;
  final VoidCallback back;
  const PasswordGeneratorPage(
      {super.key,
      required this.nameController,
      required this.passController,
      required this.data,
      required this.saveInList,
      required this.back,
      required this.passKey,
      required this.nameKey,
      required this.loginKey,
      required this.logController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Password generator'),
        actions: [
          IconButton(
              onPressed: () {
                if (nameKey.currentState!.validate() &&
                    loginKey.currentState!.validate() &&
                    passKey.currentState!.validate()) {
                  saveInList();
                }
              },
              icon: const Icon(Icons.check))
        ],
        leading: IconButton(
            onPressed: back,
            icon: IconButton(
                onPressed: back,
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 19,
                ))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, right: 20, left: 20),
        child: ListView(children: [
          Column(
            children: [
              NameForm(nameKey: nameKey, nameController: nameController),
              LoginForm(loginKey: loginKey, logController: logController),
              PassForm(passKey: passKey, passController: passController),
              MySlider(
                data: data,
              ),
              const Text('Options'),
              UpperCaseLetter(data: data),
              Numbers(data: data),
              SpecialChars(data: data),
              MyButton(data: data, passController: passController),
            ],
          ),
        ]),
      ),
    );
  }
}
