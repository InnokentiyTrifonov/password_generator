import 'package:flutter/material.dart';
import 'package:password_generator/data/password_generator.dart';

class Numbers extends StatefulWidget {
  final PasswordGenerator data;
  const Numbers({super.key, required this.data});

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Use numbers'),
        IconButton(
            onPressed: () {
              setState(() {
                widget.data.boolN = !widget.data.boolN;
              });
            },
            icon: widget.data.boolN
                ? const Icon(Icons.check_box)
                : const Icon(Icons.square_outlined))
      ],
    );
  }
}
