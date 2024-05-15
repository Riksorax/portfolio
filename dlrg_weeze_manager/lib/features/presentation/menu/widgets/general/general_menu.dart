import 'package:flutter/material.dart';

class GeneralMenu extends StatelessWidget {
  const GeneralMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text('Allgemeines'),
        ),
        InkWell(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("Einstellungen"),
          ),
        ),
      ],
    );
  }
}
