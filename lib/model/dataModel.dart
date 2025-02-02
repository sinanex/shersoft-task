class Datamodel {
  dynamic date;
  String? cashIn;
  String? cashout;
  Datamodel({required this.cashIn, required this.cashout, required this.date});
  factory Datamodel.fromFireBase(Map<String, dynamic> docs) {
    return Datamodel(
        cashIn: docs['cashin'], cashout: docs['cashout'], date: docs['date']);
  }
}
