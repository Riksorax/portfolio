import 'memberCheckIn.dart';

class Member {
  String lastname = "";
  String firstname = "";
  String birthday = "";
  String memberNumber = "";
  bool memberCardDone = false;
  List<MemberCheckIn> memberCheckIn = List.empty();

  Member(
    this.lastname,
    this.firstname,
    this.birthday,
    this.memberNumber,
    this.memberCardDone,
    this.memberCheckIn,
  );

  // Factory-Methode, um ein Member-Objekt aus einer Map zu erstellen
  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      map['lastname'],
      map['firstname'],
      map['birthday'],
      map['memberNumber'],
      map['memberCardDone'],
      map['memberCheckIn'],
    );
  }

  // Methode, um ein Member-Objekt in eine Map zu konvertieren
  Map<String, dynamic> toMap() {
    return {
      'lastname': lastname,
      'firstname': firstname,
      'birthday': birthday,
      'memberNumber': memberNumber,
      'memberCardDone': memberCardDone,
      'memberCheckIn': memberCheckIn,
    };
  }
}
