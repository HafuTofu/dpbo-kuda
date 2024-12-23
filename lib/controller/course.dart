class Course {
  int? idcourse;
  late String coursename;
  late String coursecategory;
  late String coursedesc;
  late String coursetype = "online";

  Course(this.coursename, this.coursecategory, this.coursedesc, this.coursetype);

  Course.withId(this.idcourse, this.coursename, this.coursecategory, this.coursedesc, this.coursetype);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (idcourse != null) {
      map['id'] = idcourse;
    }
    map['Coursename'] = coursename;
    map['coursecategory'] = coursecategory;
    map['coursedesc'] = coursedesc;
    map['coursetype'] = coursetype;
    return map;
  }

  Course.fromMap(Map<String, dynamic> map) {
    idcourse = map['id'];
    coursename = map['Coursename'];
    coursecategory = map['coursecategory'];
    coursedesc = map['coursedesc'];
    coursetype = map['coursetype'];
  }
}
