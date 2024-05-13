import 'package:flutter/material.dart';

class MemberCards extends StatelessWidget {
  const MemberCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
              height: 500,
              width: 200,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  TextField(),
                  ListTile(
                    leading: Icon(Icons.check_box),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        child: Placeholder(),
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
                Card(
                  child: Column(
                    children: [
                      Container(
                        child: Placeholder(),
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
          ),
        ],
      ),
    );
  }
}
