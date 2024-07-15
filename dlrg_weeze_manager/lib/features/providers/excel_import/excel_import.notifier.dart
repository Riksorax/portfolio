import 'dart:io';

import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pdf_template/pdf_template.notifier.dart';
import '../update_member/update_member.notifier.dart';

part 'excel_import.notifier.g.dart';

@riverpod
class ExcelImportNotifier extends _$ExcelImportNotifier {
  @override
  List<Map<String, Object>> build() {
    return List<Map<String, Object>>.empty();
  }

  void getExcelImport(String filePaths) {
    var bytes = File(filePaths).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    List<Map<String, Object>> listMembers = [];
    for (var value in excel.tables.keys) {
      for (var row in excel.tables[value]!.rows.skip(1)) {
        Map<String, Object> members = {
          "{{LASTNAME}}": row[0]!.value.toString(),
          "{{FIRSTNAME}}": row[1]!.value.toString(),
          "{{BIRTHDAY}}": row[2]!.value.toString(),
          "{{NUMBER}}": row[3]!.value.toString(),
          "{{MEMBERCARDDONE}}": false,
        };
        listMembers.add(members);
      }
    }
    state = listMembers;
    ref.read(updateMemberNotifierProvider.notifier).getNextMember(state);
    ref.read(pdfTemplateProvider.notifier).fillPlaceholderPDF();
  }

  void updateMemberList(Map<String, Object> member) {
    state
        .where(
          (element) => element["{{NUMBER}}"] == member["{{NUMBER}}"],
        )
        .first["{{MEMBERCARDDONE}}"] = member["{{MEMBERCARDDONE}}"]!;
  }
}
