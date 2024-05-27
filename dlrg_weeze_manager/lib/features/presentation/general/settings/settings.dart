import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/docx_template/docx_template.notifier.dart';
import '../../../providers/file_picker/file_picker.provider.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});
  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    ref.read(loadDocxTemplateProvider.notifier).createDocxTemplate();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: appTheme.colorScheme.surfaceVariant,
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 24),
      height: deviceSize.height * .5,
      width: deviceSize.width * .25,
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () async{
              ref.read(filePickerNotifierProvider.notifier).saveFileDocx();
            },
            child: const Text("Docx Ausweis Template wählen"),
          ),
        ],
      ),
    );
  }
}
