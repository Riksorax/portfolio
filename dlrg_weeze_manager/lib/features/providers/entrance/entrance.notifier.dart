import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';

part 'entrance.notifier.g.dart';

@riverpod
class EntranceNotifier extends _$EntranceNotifier {
  @override
  List<Member> build() {
    List<Member> members = [];
    return members;
  }

  void addEntranceList(Member member){
    var test = state.any((element) => element.memberNumber == member.memberNumber);
    if (!test) {
      member.memberCheckIn = true;
      state = [...state, member];
    }
  }
}
