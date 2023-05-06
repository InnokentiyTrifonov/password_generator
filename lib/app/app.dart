import 'package:flutter/material.dart';
import 'package:password_generator/pages/home_page.dart';

class PasswordManager extends StatelessWidget {
  const PasswordManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.blueAccent),
          dialogBackgroundColor: Colors.yellow[400],
          scaffoldBackgroundColor: Colors.yellow[200],
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 17)),
          colorScheme: ColorScheme.light(primary: Colors.yellow.shade400)),
      home: const HomePage(),
    );
  }
}
