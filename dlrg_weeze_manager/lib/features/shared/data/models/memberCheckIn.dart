class MemberCheckIn {
  DateTime checkInDate = DateTime.now();
  bool checkIn = false;
  bool payed = false;

  MemberCheckIn(
    this.checkInDate,
    this.checkIn,
    this.payed,
  );

  factory MemberCheckIn.fromMap(Map<String, dynamic> map) {
    return MemberCheckIn(
      DateTime.parse(map['checkInDate']),
      map['checkIn'],
      map['payed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lastname': checkInDate.toIso8601String(),
      'firstname': checkIn,
      'birthday': payed,
    };
  }
}
