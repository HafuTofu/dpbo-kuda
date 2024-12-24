class User {
  int? id;
  late String username;
  late String email;
  late String password;

  User(this.username, this.email, this.password);

  User.withId(this.id, this.username, this.email, this.password);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id_user'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
  }
}
