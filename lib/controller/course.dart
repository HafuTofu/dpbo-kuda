class Course {
  int? idcourse;
  late String coursename;
  late String coursecategory;
  late String coursedesc;
  late String coursemail;
  late String coursephone;
  late int coursecapacity = 1;
  late String coursetype = 'Online';
  late int courseparticipants = 0;

  Course(this.coursename, this.coursecategory, this.coursedesc, this.coursemail, this.coursephone, this.coursetype, this.coursecapacity);

  Course.withId(this.idcourse, this.coursename, this.coursecategory, this.coursedesc, this.coursetype, this.coursecapacity);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (idcourse != null) {
      map['id_course'] = idcourse;
    }
    map['coursename'] = coursename;
    map['coursecategory'] = coursecategory;
    map['coursedesc'] = coursedesc;
    map['coursemail'] = coursemail;
    map['coursephone'] = coursephone;
    map['coursecapacity'] = coursecapacity;
    map['coursetype'] = coursetype;
    map['courseparticipants'] = courseparticipants;
    return map;
  }

  Course.fromMap(Map<String, dynamic> map) {
    idcourse = map['id_course'];
    coursename = map['coursename'];
    coursecategory = map['coursecategory'];
    coursedesc = map['coursedesc'];
    coursemail = map['coursemail'];
    coursephone = map['coursephone'];
    coursecapacity = map['coursecapacity'];
    coursetype = map['coursetype'];
    courseparticipants = map['courseparticipants'];
  }
}
