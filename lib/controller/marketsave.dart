class MarketSave {
  late int idmarket;
  late int iduser;

  MarketSave(this.idmarket, this.iduser);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id_market'] = idmarket;
    map['id_user'] = iduser;
    return map;
  }

  MarketSave.fromMap(Map<String, dynamic> map) {
    idmarket = map['id_market'];
    iduser = map['id_user'];
  }
}
