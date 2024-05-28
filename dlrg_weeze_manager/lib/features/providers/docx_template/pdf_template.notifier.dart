import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../file_picker/file_picker.provider.dart';

part 'pdf_template.notifier.g.dart';

@riverpod
class PdfTemplate extends _$PdfTemplate {
  @override
  String build() {
    return "Laden erfolgreich";
  }

  void createDocxTemplate() async{
    var path = await ref.read(filePickerNotifierProvider.notifier).loadMemberCardTemplate();
    final pdfFile = PdfDocument(inputBytes: File("${path.path}\\MitgliedsausweisTemplate.pdf").readAsBytesSync());
    final PdfPage page = pdfFile.pages[0];
  }

  Future<String?> loadPdfTemplate() async{
    var path = await ref.read(filePickerNotifierProvider.notifier).loadMemberCardTemplate();
    var pathExists = await path.exists();
    if (!pathExists) {
      return null;
    }
    var completePath = '${path.path}\\MitgliedsausweisTemplate.pdf';
    var file = await File(completePath).exists();
    if (!file) {
      return null;
    }
    state = completePath;
    return completePath;
  }
}
