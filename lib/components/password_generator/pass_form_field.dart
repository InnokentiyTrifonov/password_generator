import 'package:flutter/material.dart';

class PassFormField extends StatefulWidget {
  final TextEditingController passController;
  final GlobalKey<FormState> passKey;
  const PassFormField(
      {super.key, required this.passKey, required this.passController});

  @override
  State<PassFormField> createState() => _PassFormFieldState();
}

class _PassFormFieldState extends State<PassFormField> {
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
                  return 'Enter correct password';
                } else {
                  return null;
                }
              },
              maxLength: 25,
              controller: widget.passController,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: 'Generated password',
                  focusedBorder: UnderlineInputBorder()),
            ),
          ],
        ));
  }
}
