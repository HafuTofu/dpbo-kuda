class Enrollment {
  late int idcourse;
  late int iduser;

  Enrollment(this.idcourse, this.iduser);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id_course'] = idcourse;
    map['id_user'] = iduser;
    return map;
  }

  Enrollment.fromMap(Map<String, dynamic> map) {
    idcourse = map['id_course'];
    iduser = map['id_user'];
  }
}
