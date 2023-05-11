import 'package:flutter/material.dart';

class PassForm extends StatefulWidget {
  final TextEditingController passController;
  final GlobalKey<FormState> passKey;
  const PassForm(
      {super.key, required this.passKey, required this.passController});

  @override
  State<PassForm> createState() => _PassFormState();
}

class _PassFormState extends State<PassForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.passKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Password is Empty';
                } else if (value.contains(RegExp(r'\s'))) {
                  return 'please enter the correct password';
                } else {
                  return null;
                }
              },
              maxLength: 25,
              controller: widget.passController,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: 'Your password',
                  focusedBorder: UnderlineInputBorder()),
            ),
          ],
        ));
  }
}
