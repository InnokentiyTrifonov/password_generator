import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback save;
  final VoidCallback back;
  const MyAppBar({
    super.key,
    required this.save,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: back,
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 18,
            )),
        const Text('Password generator'),
        IconButton(onPressed: save, icon: const Icon(Icons.check)),
      ],
    );
  }
}
