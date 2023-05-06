import 'package:flutter/material.dart';
import 'package:password_generator/data/password_generator.dart';

class UpperCaseLetter extends StatefulWidget {
  final PasswordGenerator data;
  const UpperCaseLetter({super.key, required this.data});

  @override
  State<UpperCaseLetter> createState() => _UpperCaseLetterState();
}

class _UpperCaseLetterState extends State<UpperCaseLetter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Use upper case'),
        IconButton(
            onPressed: () {
              setState(() {
                widget.data.boolUCL = !widget.data.boolUCL;
              });
            },
            icon: widget.data.boolUCL
                ? const Icon(Icons.check_box)
                : const Icon(Icons.square_outlined))
      ],
    );
  }
}
