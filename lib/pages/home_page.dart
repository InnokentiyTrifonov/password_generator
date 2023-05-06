import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_generator/components/home_page/passwords.dart';
import 'package:password_generator/data/password_generator.dart';
import 'package:password_generator/pages/password_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  PasswordGenerator data = PasswordGenerator();
  final Box box = Hive.box('myBox');

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached) {
      box.close();
    }
  }

  void loadData() {
    data.data = box.get('PASSWORDS');
  }

  void uploadData() {
    box.put('PASSWORDS', data.data);
  }

  void createInitData() {
    data.data = [];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (box.get('PASSWORDS') == null) {
      createInitData();
    } else {
      loadData();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void deletePassword(int index) {
    setState(() {
      data.data.removeAt(index);
    });
    uploadData();
  }

  void createNewPass() {
    showDialog(
        context: context,
        builder: (context) => PasswordGeneratorPage(
              nameController: _nameController,
              passController: _passController,
              data: data,
              saveInList: saveInList,
              back: back,
            ));
  }

  void back() {
    Navigator.pop(context);
    setState(() {
      _nameController.clear();
      _passController.clear();
      data.boolUCL = false;
      data.boolSC = false;
      data.boolN = false;
      data.passwordLenght = 0;
    });
  }

  void saveInList() {
    setState(() {
      if (_passController.text.isNotEmpty) {
        data.data.add([_nameController.text, _passController.text]);
        Navigator.pop(context);
        _nameController.clear();
        _passController.clear();
        data.boolUCL = false;
        data.boolSC = false;
        data.boolN = false;
        data.passwordLenght = 0;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password is Empty'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Password generator',
          ),
          actions: [
            IconButton(onPressed: createNewPass, icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              return Passwords(
                name: data.data[index][0],
                password: data.data[index][1],
                deletePassword: (context) => deletePassword(index),
                copyThePassword: () {
                  final copiedPass = ClipboardData(text: data.data[index][1]);
                  Clipboard.setData(copiedPass);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Password copied'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 1),
                  ));
                },
              );
            }));
  }
}
