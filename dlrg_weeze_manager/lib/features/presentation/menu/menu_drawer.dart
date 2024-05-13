import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationDrawer(
      children: [
        ListTile(
          title: Text('Karten'),
        ),
        ListTile(leading: Icon(Icons.create), title: Text("Erstellen"),),
        ListTile(leading: Icon(Icons.print), title: Text("Neu Drucken"),),
        ListTile(leading: Icon(Icons.list), title: Text("Übersicht"),),
        Divider(),
        ListTile(
          title: Text('Hallenbad'),
        ),
        ListTile(leading: Icon(Icons.door_sliding), title: Text("Einlass"),),
        ListTile(leading: Icon(Icons.timer), title: Text("Training"),),
        ListTile(leading: Icon(Icons.list), title: Text("Übersicht"),),
        Divider(),
        ListTile(
          title: Text('Allgemeines'),
        ),
        ListTile(leading: Icon(Icons.settings), title: Text("Einstellungen"),),
      ],
    );
  }
}
