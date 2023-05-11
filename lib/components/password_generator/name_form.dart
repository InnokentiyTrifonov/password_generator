import 'package:flutter/material.dart';

class NameForm extends StatefulWidget {
  final GlobalKey<FormState> nameKey;
  final TextEditingController nameController;
  const NameForm(
      {super.key, required this.nameController, required this.nameKey});

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.nameKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name for password is Empty';
                } else {
                  return null;
                }
              },
              maxLength: 25,
              controller: widget.nameController,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: 'Name for password',
                  focusedBorder: UnderlineInputBorder()),
            ),
          ],
        ));
  }
}
