import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/widgets/base_scaffold.dart';
import 'widgets/member_card_template.dart';
import 'widgets/user_settings.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});
  static const routeName = "/settings";

  @override
  ConsumerState<Settings> createState() => _SettingsState();

}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;


    return BaseScaffold(title: 'Einstellungen', body: Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(
            fit: FlexFit.loose,
            child: MemberCardTemplate(),
          ),
          /*SizedBox(
            height: 50,
            width: deviceSize.width * 0.2,
          ),*/
          UserSettings(),
        ],
      ),
    ), onItemTapped: (_) {
      // Logik zur Handhabung von Drawer-Taps
    });
  }
}
