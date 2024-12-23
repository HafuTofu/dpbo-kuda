class Course {
  int? idcourse;
  late String coursename;
  late String email;
  late String password;

  Course(this.coursename, this.email, this.password);

  Course.withId(this.idcourse, this.coursename, this.email, this.password);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (idcourse != null) {
      map['id'] = idcourse;
    }
    map['Coursename'] = coursename;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  Course.fromMap(Map<String, dynamic> map) {
    idcourse = map['id'];
    coursename = map['Coursename'];
    email = map['email'];
    password = map['password'];
  }
}
