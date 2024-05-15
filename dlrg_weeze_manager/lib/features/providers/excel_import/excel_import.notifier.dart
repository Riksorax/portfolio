import 'dart:io';

import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'excel_import.notifier.g.dart';

@riverpod
class ExcelImportNotifier extends _$ExcelImportNotifier {
  @override
  List<Map> build() {
    return List<Map>.empty();
  }

  void getExcelImport(String filePaths) {
    var bytes = File(filePaths).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    List<Map> listMembers = [];
    for (var value in excel.tables.keys) {
      for (var row  in excel.tables[value]!.rows.skip(1)) {
        Map<String, Object> members = {
          "lastName": row[0]!.value.toString(),
          "fistName": row[1]!.value.toString(),
          "birthDay": row[2]!.value.toString(),
          "memberNo": row[3]!.value.toString(),
          "memberCardDone": false,
        };
        listMembers.add(members);
      }
    }
    state = listMembers;
  }
}
