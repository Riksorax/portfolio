import 'dart:io';

import 'package:docx_template/docx_template.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../file_picker/file_picker.provider.dart';

part 'pdf_template.notifier.g.dart';

@riverpod
class PdfTemplate extends _$PdfTemplate {
  @override
  String build() {
    return "";
  }

  Future<String?> loadPdfTemplate() async {
    var path = await ref
        .read(filePickerNotifierProvider.notifier)
        .loadMemberCardTemplate();
    var pathExists = await path.exists();
    if (!pathExists) {
      return null;
    }
    var completePath = '${path.path}\\MitgliedsausweisTemplate.docx';
    var file = await File(completePath).exists();
    if (!file) {
      return null;
    }
    //state = completePath;
    return completePath;
  }

  Future<void> fillPlaceholderPDF() async {
    // Laden Sie die PDF-Datei
    var docxTemplate = await loadPdfTemplate();
    var docx = File(docxTemplate!);
    final template = await DocxTemplate.fromBytes( await docx.readAsBytes());

    template.substitute

    // Platzhalter und deren Werte definieren
    final placeholders = {
      '{{FIRSTNAME}}': 'Frank',
      '{{LASTNAME}}': 'Speulmans',
      '{{NUMBER}}': '848798798',
    };



    // Speichern Sie die Datei auf dem Gerät
    const String outputPath = 'C:\\Users\\Frank\\Documents\\DLRG\\AusweisTemplate\\MitgliedsausweisTemplateCopy.pdf';
    final File outputFile = File(outputPath);
    //await outputFile.writeAsBytes(updatedPdfBytes);
  }

}
