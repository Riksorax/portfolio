import 'dart:io';

import 'package:docx_template/docx_template.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../file_picker/file_picker.provider.dart';

part 'docx_template.notifier.g.dart';

@riverpod
class LoadDocxTemplate extends _$LoadDocxTemplate {
  @override
  String build() {
    return "Laden erfolgreich";
  }

  void createDocxTemplate() async{
    var path = await ref.read(filePickerNotifierProvider.notifier).loadMemberCardTemplate();
    final f = File("${path.path}\\MitgliedsausweiseTemplate.docx");
    final docx = await DocxTemplate.fromBytes(await f.readAsBytes());


  }
}
