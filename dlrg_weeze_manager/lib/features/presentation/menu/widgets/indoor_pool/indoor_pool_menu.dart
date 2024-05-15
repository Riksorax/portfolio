import 'package:flutter/material.dart';

class IndoorPoolMenu extends StatelessWidget {
  const IndoorPoolMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text('Hallenbad'),
        ),
        ListTile(leading: Icon(Icons.door_sliding), title: Text("Einlass"),),
        ListTile(leading: Icon(Icons.timer), title: Text("Training"),),
        ListTile(leading: Icon(Icons.list), title: Text("Übersicht"),),
      ],
    );
  }
}
