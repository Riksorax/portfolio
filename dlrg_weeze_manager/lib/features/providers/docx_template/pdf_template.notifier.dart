import 'dart:io';
import 'dart:ui';

import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
    var completePath = '${path.path}\\MitgliedsausweisTemplate.pdf';
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
    var pdfPath = File(docxTemplate!).readAsBytesSync();
    final PdfDocument document =
    PdfDocument(inputBytes: pdfPath);

    PdfTextExtractor extractor = PdfTextExtractor(document);
    var result = extractor.extractText();
    String modifiedText = result;
    final PdfPage page = document.pages[0];

    // Platzhalter und deren Werte definieren
    final placeholders = {
      '{{FIRSTNAME}}': 'Frank',
      '{{LASTNAME}}': 'Speulmans',
      '{{NUMBER}}': '848798798',
    };

    placeholders.forEach((placeholder, value) {
      modifiedText = modifiedText.replaceAll(placeholder, value);
    });

    if (result != modifiedText) {
      // Originaltext löschen, indem ein weißes Rechteck über den Text gezeichnet wird
      final PdfGraphics graphics = page.graphics;
      final Rect rect = Rect.fromLTWH(0, 0, page.getClientSize().width - 110, page.getClientSize().height);
      graphics.drawRectangle(
        brush: PdfSolidBrush(PdfColor(255, 255, 255)),
        bounds: rect,
      );

      for (var value in extractor.extractTextLines()) {
        var fontSize = value.fontSize;
        var bounds = value.bounds;
        var fontName = value.fontName;
        var text = value.text;

        // Modifizierten Text hinzufügen
        graphics.drawString(
          text,
          PdfStandardFont(getFontFamily(fontName), fontSize),
          bounds: bounds,
          brush: PdfSolidBrush(PdfColor(204, 204, 204))
        );
      }

    }

    // Speichern Sie die Datei auf dem Gerät
    const String outputPath = 'C:\\Users\\Frank\\Documents\\DLRG\\AusweisTemplate\\MitgliedsausweisTemplateCopy.pdf';

    // Neue PDF-Datei speichern
    final List<int> newBytes = document.saveSync();
    final File newFile = File(outputPath);
    await newFile.writeAsBytes(newBytes);

    // PDF-Dokument schließen
    document.dispose();
  }

  PdfFontFamily getFontFamily(String fontName) {
    for (var family in PdfFontFamily.values) {
      if (family.toString().split('.').last.toLowerCase() == fontName.toLowerCase()) {
        return family;
      }
    }
    // Fallback zu einer Standardschriftart, falls nicht gefunden
    return PdfFontFamily.helvetica;
  }

}
