import 'package:flutter/material.dart';
import 'package:password_generator/data/password_generator.dart';

class SpecialChars extends StatefulWidget {
  final PasswordGenerator data;
  const SpecialChars({super.key, required this.data});

  @override
  State<SpecialChars> createState() => _SpecialCharsState();
}

class _SpecialCharsState extends State<SpecialChars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Use special chars'),
        IconButton(
            onPressed: () {
              setState(() {
                widget.data.boolSC = !widget.data.boolSC;
              });
            },
            icon: widget.data.boolSC
                ? const Icon(Icons.check_box)
                : const Icon(Icons.square_outlined))
      ],
    );
  }
}
