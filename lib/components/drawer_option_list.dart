import 'package:flutter/material.dart';

class DrawerOptionList extends StatefulWidget {
  const DrawerOptionList({super.key});

  @override
  State<DrawerOptionList> createState() => _DrawerOptionListState();
}

class _DrawerOptionListState extends State<DrawerOptionList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.purple[300],
          ),
          child: const Text(
            'TodoList Menu',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: const Text(' My Profile '),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.workspace_premium),
          title: const Text(' Go Premium '),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }
}
