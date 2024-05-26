import 'package:flutter/material.dart';

class CardsMenu extends StatelessWidget {
  final Function(int) onItemTapped;
  const CardsMenu({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Karten'),
        ),
        ListTile(
          leading: Icon(Icons.create),
          title: Text("Erstellen"),
          onTap: () {
            onItemTapped(0);
          },
        ),
        ListTile(
          leading: Icon(Icons.print),
          title: Text("Neu Drucken"),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text("Übersicht"),
        ),
      ],
    );
  }
}
