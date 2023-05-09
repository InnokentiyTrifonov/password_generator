import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Passwords extends StatelessWidget {
  final String name;
  final String password;
  final VoidCallback copyThePassword;
  final Function(BuildContext)? deletePassword;
  final Function(BuildContext)? editPassword;
  const Passwords({
    super.key,
    required this.name,
    required this.password,
    required this.deletePassword,
    required this.copyThePassword,
    this.editPassword,
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
          child: ListTile(
            onLongPress: copyThePassword,
            title: Text(name),
            subtitle: Text(password),
          ),
        ),
      ),
    );
  }
}
