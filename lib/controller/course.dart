class Course {
  int? idcourse;
  late String coursename;
  late String coursecategory;
  late String coursedesc;
  late int? coursecapacity;
  late String? coursetype;

  String courseTable = '''
  CREATE TABLE course(
    id_course INTEGER PRIMARY KEY AUTOINCREMENT,
    coursename TEXT NOT NULL,
    coursecategory TEXT NOT NULL,
    coursetype ENUM('Offline','Online') NOT NULL DEFAULT 'Online',
    coursedesc TEXT NOT NULL,
    coursecapacity INTEGER NOT NULL DEFAULT 1,
    courseparticipants INTEGER NOT NULL DEFAULT 0
  )
  ''';

  Course(this.coursename, this.coursecategory, this.coursedesc, this.coursetype);

  Course.withId(this.idcourse, this.coursename, this.coursecategory, this.coursedesc, this.coursetype);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (idcourse != null) {
      map['id_course'] = idcourse;
    }
    map['coursename'] = coursename;
    map['coursecategory'] = coursecategory;
    map['coursedesc'] = coursedesc;
    map['coursecapacity'] = coursecapacity ?? 1;
    map['coursetype'] = coursetype ?? 'online';
    return map;
  }

  Course.fromMap(Map<String, dynamic> map) {
    idcourse = map['id'];
    coursename = map['coursename'];
    coursecategory = map['coursecategory'];
    coursedesc = map['coursedesc'];
    coursetype = map['coursetype'];
    coursecapacity = map['coursecapacity'];
  }
}
