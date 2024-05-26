import 'package:flutter/material.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({Key? key}) : super(key: key);

  @override
  _CreateCardState createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      height: deviceSize.height * .78,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Placeholder(),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: null,
                      label: const Text("Drucken"),
                      icon: const Icon(Icons.print),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      label: const Text("NFC"),
                      icon: const Icon(Icons.nfc),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      label: const Text("Nächster"),
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: deviceSize.height * .15,
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Placeholder(),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: null,
                      label: const Text("Drucken"),
                      icon: const Icon(Icons.print),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      label: const Text("NFC"),
                      icon: const Icon(Icons.nfc),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      label: const Text("Nächster"),
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
