import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_generator/components/home_page/passwords.dart';
import 'package:password_generator/data/password_generator.dart';
import 'package:password_generator/pages/edit_page.dart';
import 'package:password_generator/pages/password_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final passKey = GlobalKey<FormState>();
  final nameKey = GlobalKey<FormState>();
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (box.get('PASSWORDS') == null) {
      data.data = [];
    } else {
      loadData();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    PasswordGenerator.themeData.dispose();
    _nameController;
    _passController;
    super.dispose();
  }

  void editPass(int index) {
    setState(() {
      data.data[index] = [_nameController.text.trim(), _passController.text];
    });
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
              passKey: passKey,
              nameKey: nameKey,
            ));
  }

  void editPassword(int index) {
    showDialog(
        context: context,
        builder: (context) => EditPage(
              data: data,
              index: index,
              nameController: _nameController,
              passController: _passController,
              saveEdited: saveEdited,
              back: back,
              passKey: passKey,
              nameKey: nameKey,
            ));
  }

  void saveEdited() {
    setState(() {
      Navigator.pop(context);
      uploadData();
      _nameController.clear();
      _passController.clear();
      data.boolUCL = false;
      data.boolSC = false;
      data.boolN = false;
      data.passwordLenght = 0;
    });
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
      if (nameKey.currentState!.validate() &&
          passKey.currentState!.validate()) {
        data.data.add([_nameController.text.trim(), _passController.text]);
        Navigator.pop(context);
        uploadData();
        _nameController.clear();
        _passController.clear();
        data.boolUCL = false;
        data.boolSC = false;
        data.boolN = false;
        data.passwordLenght = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = PasswordGenerator.themeData.value;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Password manager',
        ),
        actions: [
          IconButton(
              onPressed: () {
                isDark = !isDark;
                PasswordGenerator.themeData.value = isDark;
                PasswordGenerator.uploadThemeData();
              },
              icon: Icon(PasswordGenerator.themeData.value
                  ? Icons.wb_sunny_outlined
                  : Icons.wb_sunny_rounded))
        ],
      ),
      body: ListView.builder(
          itemCount: data.data.length,
          itemBuilder: (context, index) {
            return Passwords(
              name: data.data[index][0],
              password: data.data[index][1],
              editPassword: (context) => editPassword(index),
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
          }),
      floatingActionButton: GestureDetector(
        onTap: createNewPass,
        child: Container(
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor),
          width: double.infinity,
          height: 55,
          child: const Center(
            child: Text(
              'Add new password',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
