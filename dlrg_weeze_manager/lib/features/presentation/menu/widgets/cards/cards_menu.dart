import 'package:flutter/material.dart';

class CardsMenu extends StatelessWidget {
  const CardsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text('Karten'),
        ),
        ListTile(leading: Icon(Icons.create), title: Text("Erstellen"),),
        ListTile(leading: Icon(Icons.print), title: Text("Neu Drucken"),),
        ListTile(leading: Icon(Icons.list), title: Text("Übersicht"),),
      ],
    );
  }
}
