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

class EditPage extends StatelessWidget {
  final PasswordGenerator data;
  final int index;
  final GlobalKey<FormState> nameKey;
  final GlobalKey<FormState> loginKey;
  final GlobalKey<FormState> passKey;
  final TextEditingController nameController;
  final TextEditingController logController;
  final TextEditingController passController;

  final VoidCallback saveEdited;
  final VoidCallback back;
  const EditPage(
      {super.key,
      required this.nameController,
      required this.passController,
      required this.saveEdited,
      required this.back,
      required this.passKey,
      required this.nameKey,
      required this.index,
      required this.data,
      required this.loginKey,
      required this.logController});

  @override
  Widget build(BuildContext context) {
    nameController.text = data.data[index][0];
    logController.text = data.data[index][1];
    passController.text = data.data[index][2];
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
                  data.data[index][0] = nameController.text.trim();
                  data.data[index][1] = logController.text;
                  data.data[index][2] = passController.text;
                  saveEdited();
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
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
        ),
      ]),
    );
  }
}
