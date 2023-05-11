import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Passwords extends StatelessWidget {
  final String name;
  final String login;
  final String password;
  final Function(BuildContext)? deletePassword;
  final Function(BuildContext)? editPassword;
  const Passwords({
    super.key,
    required this.name,
    required this.password,
    required this.deletePassword,
    this.editPassword,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Slidable(
        endActionPane: ActionPane(
            extentRatio: 0.5,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(20),
                onPressed: editPassword,
                icon: Icons.edit_note,
                backgroundColor: Colors.blueAccent,
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(20),
                onPressed: deletePassword,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ]),
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(name),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(login),
                      IconButton(
                        onPressed: () {
                          final copiedPass = ClipboardData(text: login);
                          Clipboard.setData(copiedPass);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('login copied'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 1)));
                        },
                        icon: const Icon(Icons.copy_outlined),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(password),
                      IconButton(
                        onPressed: () {
                          final copiedPass = ClipboardData(text: password);
                          Clipboard.setData(copiedPass);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Password copied'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 1)));
                        },
                        icon: const Icon(Icons.copy_outlined),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
