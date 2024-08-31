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
    member.memberCheckIn = true;
    state = [...state, member];
  }
}
