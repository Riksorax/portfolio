import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../excel_import/excel_import.notifier.dart';
import '../nfc/nfc_write.notifier.dart';
import '../pdf_template/pdf_template.notifier.dart';

part 'update_member.notifier.g.dart';

@riverpod
class UpdateMemberNotifier extends _$UpdateMemberNotifier {
  @override
  Map<String, Object> build() => {};

  void getNextMember(List<Map<String, Object>> memberList) {
    for (var element in memberList) {
      var memberDone = element["{{MEMBERCARDDONE}}"] as bool;
      if (!memberDone) {
        state = element;
        break;
      }
    }
  }

  void updateMemberCardDone() {
    if (state.isNotEmpty) {
      var memberDone = state["{{MEMBERCARDDONE}}"] as bool;
      if (!memberDone) {
        state["{{MEMBERCARDDONE}}"] = true;
        ref.read(excelImportNotifierProvider.notifier).updateMemberList(state);
      }
    }
    final nextMemberList = ref.read(excelImportNotifierProvider);
    ref.read(updateMemberNotifierProvider.notifier).getNextMember(nextMemberList);
    ref.read(pdfTemplateProvider.notifier).fillPlaceholderPDF();
    ref.read(nfcWriteNotifierProvider.notifier).resteState();
  }
}
