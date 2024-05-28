import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../providers/docx_template/pdf_template.notifier.dart';
import '../../../../providers/file_picker/file_picker.provider.dart';

class MemberCardTemplate extends ConsumerStatefulWidget {
  const MemberCardTemplate({super.key});

  @override
  ConsumerState<MemberCardTemplate> createState() => _MemberCardTemplateState();
}

class _MemberCardTemplateState extends ConsumerState<MemberCardTemplate> {

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    ref.read(pdfTemplateProvider.notifier).createDocxTemplate();

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
              ref.read(filePickerNotifierProvider.notifier).saveFilePdf();
            },
            child: const Text("PDF Ausweis Template wählen"),
          ),
          /*Card(
            child: SfPdfViewer.asset("assets/templates/MitgliedsausweisTemplate.pdf"),
          ),*/
        ],
      ),
    );
  }
}
