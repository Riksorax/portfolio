import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/providers/firebase_repository.provider.dart';
import '../update_member/update_member_check_in.notifier.dart';

part 'entrance.notifier.g.dart';

@riverpod
class EntranceNotifier extends _$EntranceNotifier {
  @override
  List<Member> build() {
    List<Member> members = [];
    return members;
  }

  void addEntranceList(Member member) {
    var checkMember = checkMemberNumber(member);
    if (!checkMember) {
      var memberCheckIn = ref.read(updateMemberCheckInNotifierProvider);
      member.memberCheckIn.add(memberCheckIn);
      state = [...state, member];
    }
  }

  bool checkMemberNumber(Member member) {
    return state.any((element) => element.memberNumber == member.memberNumber);
  }
}
