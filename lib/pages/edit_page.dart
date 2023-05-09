import 'package:flutter/material.dart';
import 'package:password_generator/components/password_generator/my_app_bar.dart';
import 'package:password_generator/components/password_generator/my_button.dart';
import 'package:password_generator/components/password_generator/my_slider.dart';
import 'package:password_generator/components/password_generator/name_form_field.dart';
import 'package:password_generator/components/password_generator/options/numbers.dart';
import 'package:password_generator/components/password_generator/options/special_chars.dart';
import 'package:password_generator/components/password_generator/options/upper_case_letter.dart';
import 'package:password_generator/components/password_generator/pass_form_field.dart';
import 'package:password_generator/data/password_generator.dart';

class EditPage extends StatelessWidget {
  final PasswordGenerator data;
  final int index;
  final GlobalKey<FormState> nameKey;
  final GlobalKey<FormState> passKey;
  final TextEditingController nameController;
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
      required this.data});

  @override
  Widget build(BuildContext context) {
    nameController.text = data.data[index][0];
    passController.text = data.data[index][1];
    return AlertDialog(
      content: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                back: back,
                save: () {
                  if (nameKey.currentState!.validate() &&
                      passKey.currentState!.validate()) {
                    data.data[index][0] = nameController.text.trim();
                    data.data[index][1] = passController.text;
                    saveEdited();
                  }
                },
              ),
              NameFormField(
                nameController: nameController,
                nameKey: nameKey,
              ),
              PassFormField(
                passKey: passKey,
                passController: passController,
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
