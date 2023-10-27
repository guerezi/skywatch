class Rain {
  late double hour;

  Rain._();

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain._()..hour = map['1h'].toDouble();
  }
}
