class Market {
  int? idmarket;
  late String marketname;
  late String marketype;
  late String marketdesc;
  late String marketmail;
  late String marketphone;
  late String marketloc;

  Market(this.marketname, this.marketype, this.marketdesc, this.marketmail, this.marketphone, this.marketloc);

  Market.withId(this.idmarket, this.marketname, this.marketype, this.marketdesc, this.marketmail, this.marketphone, this.marketloc);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (idmarket != null) {
      map['id_market'] = idmarket;
    }
    map['marketname'] = marketname;
    map['marketype'] = marketype;
    map['marketdesc'] = marketdesc;
    map['marketmail'] = marketmail;
    map['marketphone'] = marketphone;
    map['marketloc'] = marketloc;
    return map;
  }

  Market.fromMap(Map<String, dynamic> map) {
    idmarket = map['id_market'];
    marketname = map['marketname'];
    marketype = map['marketype'];
    marketdesc = map['marketdesc'];
    marketmail = map['marketmail'];
    marketphone = map['marketphone'];
    marketloc = map['marketloc'];
  }
}
