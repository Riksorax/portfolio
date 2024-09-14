import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/member.dart';

part 'firebase_repository.provider.g.dart';

@riverpod
Future<bool> saveMemberRepo(SaveMemberRepoRef ref, Member member) async {
  try {
    await _saveMember(member); // Wichtiger: await hinzufügen, um asynchrone Operation zu erwarten
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<void> _saveMember(Member member) async {
  var getMember = await _getMember(member.memberNumber);
  // Zugriff auf die Realtime Database
  if (getMember == null) {
    DatabaseReference dbRef =
    FirebaseDatabase.instance.ref("members").child(member.memberNumber);
    await dbRef.set(member.toMap());
  }
}

@riverpod
Future<Member?> getMemberRepo(GetMemberRepoRef ref, String memberNumber) async {
  try {
    var member = await _getMember(memberNumber);
    return member;
  } catch (e) {
    print("Fehler beim Laden des Mitglieds: $e");
    return null;
  }
}

Future<Member?> _getMember(String memberNumber) async {
  // Zugriff auf den spezifischen Knoten in der Datenbank
  DatabaseReference dbRef =
  FirebaseDatabase.instance.ref("members").child(memberNumber);

  // Daten abrufen (asynchron)
  DataSnapshot snapshot = await dbRef.get();

  // Daten in ein Member-Objekt umwandeln
  if (snapshot.exists) {
    Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

    // Konvertiere Map<dynamic, dynamic> in Map<String, dynamic>
    Map<String, dynamic> stringMap =
    data.map((key, value) => MapEntry(key as String, value));
    return Member.fromMap(stringMap);
  } else {
    return null; // Mitglied nicht gefunden
  }
}

@riverpod
Future<bool> updateMemberRepo(UpdateMemberRepoRef ref, Member member) async {
  try {
    await _updateMember(member);
    return true;
  } catch (e) {
    print("Fehler beim Laden des Mitglieds: $e");
    return false;
  }
}

Future<void> _updateMember(Member member) async {
  // Zugriff auf den spezifischen Knoten in der Datenbank
  DatabaseReference dbRef =
  FirebaseDatabase.instance.ref("members").child(member.memberNumber);

  // Daten abrufen (asynchron)
  await dbRef.update(member.toMap());
}

@riverpod
Future<bool> deleteMemberRepo(DeleteMemberRepoRef ref, String memberNumber) async {
  try {
    await _deleteMember(memberNumber);
    return true;
  } catch (e) {
    print("Fehler beim Löschen des Mitglieds: $e");
    return false;
  }
}

Future<void> _deleteMember(String memberNumber) async {
  // Zugriff auf den spezifischen Knoten in der Datenbank
  DatabaseReference dbRef =
  FirebaseDatabase.instance.ref("members").child(memberNumber);

  // Mitglied aus der Datenbank löschen (asynchron)
  await dbRef.remove();
}

@riverpod
Future<List<Member>> getAllMembersRepo(GetAllMembersRepoRef ref) async {
  try {
    var members = await _getAllMembers();
    return members;
  } catch (e) {
    print("Fehler beim Laden des Mitglieds: $e");
    return [];
  }
}

Future<List<Member>> _getAllMembers() async {
  try {
    // Access the "members" node in your database
    DatabaseReference dbRef = FirebaseDatabase.instance.ref("members");

    // Get all child nodes (members) as a list of DataSnapshots
    DataSnapshot snapshot = await dbRef.get();

    if (snapshot.exists) {
      List<Member> members = [];
      for (DataSnapshot childSnapshot in snapshot.children) {
        // Convert each child snapshot to a Member object
        var data = childSnapshot.value;

        if (data is Map) {
          Map<String, dynamic> stringMap = Map<String, dynamic>.from(data);
          members.add(Member.fromMap(stringMap));
        } else {
          print("Unexpected data format: $data");
        }
      }
      return members;
    } else {
      return []; // No members found
    }
  } catch (e) {
    print("Fehler beim Laden der Mitglieder: $e");
    return [];
  }
}
