class Member {
  String lastname = "";
  String firstname = "";
  String birthday = "";
  String memberNumber = "";
  bool memberCardDone = false;
  bool memberCheckIn = false;
  DateTime checkInDate = DateTime.now();

  Member(
    this.lastname,
    this.firstname,
    this.birthday,
    this.memberNumber,
    this.memberCardDone,
    this.memberCheckIn,
    this.checkInDate,
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
      DateTime.parse(map['checkInDate']),
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
      'checkInDate': checkInDate.toIso8601String(),
    };
  }
}
