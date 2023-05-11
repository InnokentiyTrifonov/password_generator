import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> loginKey;
  final TextEditingController logController;
  const LoginForm(
      {super.key, required this.loginKey, required this.logController});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.loginKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Login is Empty';
                } else if (value.contains(RegExp(r'\s'))) {
                  return 'please enter the correct login';
                } else {
                  return null;
                }
              },
              maxLength: 25,
              controller: widget.logController,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: 'Your login',
                  focusedBorder: UnderlineInputBorder()),
            ),
          ],
        ));
  }
}
