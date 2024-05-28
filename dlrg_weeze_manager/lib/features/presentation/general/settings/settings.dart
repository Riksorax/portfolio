import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/member_card_template.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});
  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {

    return MemberCardTemplate();
  }
}
