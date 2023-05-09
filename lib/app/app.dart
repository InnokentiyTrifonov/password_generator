import 'package:flutter/material.dart';
import 'package:password_generator/data/password_generator.dart';
import 'package:password_generator/pages/home_page.dart';

class PasswordManager extends StatefulWidget {
  const PasswordManager({super.key});

  @override
  State<PasswordManager> createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: PasswordGenerator.themeData,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    backgroundColor: Colors.amber),
                primaryColor: const Color.fromARGB(255, 216, 216, 216),
                scaffoldBackgroundColor: Colors.white),
            darkTheme: ThemeData.dark(),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(),
          );
        });
  }
}
