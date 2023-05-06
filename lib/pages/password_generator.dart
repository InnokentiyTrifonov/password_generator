import 'package:flutter/material.dart';
import 'package:password_generator/components/password_generator/my_app_bar.dart';
import 'package:password_generator/components/password_generator/my_button.dart';
import 'package:password_generator/components/password_generator/my_slider.dart';
import 'package:password_generator/components/password_generator/options/numbers.dart';
import 'package:password_generator/components/password_generator/options/special_chars.dart';
import 'package:password_generator/components/password_generator/options/upper_case_letter.dart';
import 'package:password_generator/data/password_generator.dart';

class PasswordGeneratorPage extends StatelessWidget {
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
      required this.back});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                back: back,
                save: saveInList,
              ),
              TextField(
                  maxLength: 50,
                  controller: nameController,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      hintText: 'Name the password',
                      focusedBorder: UnderlineInputBorder())),
              TextField(
                maxLength: 25,
                controller: passController,
                autocorrect: false,
                decoration: const InputDecoration(
                    hintText: 'Generated password',
                    focusedBorder: UnderlineInputBorder()),
              ),
              MySlider(
                data: data,
              ),
              const Text('Options'),
              UpperCaseLetter(data: data),
              Numbers(data: data),
              SpecialChars(data: data),
              MyButton(data: data, passController: passController)
            ],
          ),
        ),
      ),
    );
  }
}
