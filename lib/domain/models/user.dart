class User {
  User._();

  late String name;

  factory User.fromMap(Map<String, dynamic> data) {
    return User._()..name = data['name'];
  }
}
