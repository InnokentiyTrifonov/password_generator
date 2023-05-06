import 'package:flutter/material.dart';
import 'package:password_generator/data/password_generator.dart';

class MySlider extends StatefulWidget {
  final PasswordGenerator data;
  const MySlider({super.key, required this.data});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        thumbColor: Colors.amber,
        activeTrackColor: Colors.amber,
        inactiveTrackColor: Colors.black12,
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Slider(
        divisions: 25,
        label: widget.data.passwordLenght.toString(),
        value: widget.data.passwordLenght.toDouble(),
        min: 0,
        max: 25,
        onChanged: (value) {
          setState(() {
            widget.data.passwordLenght = value.toInt();
          });
        },
      ),
    );
  }
}
