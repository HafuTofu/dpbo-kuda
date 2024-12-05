import 'package:flutter/material.dart';

class Materials {
  List<Color> pallete = const [
    Color(0xFF575757),
    Color(0xFF808080),
    Color(0xFF9c9c9c),
    Color(0xFF808080),
    Color(0xFF575757),
  ];

  List<Color> getFootColors() {
    return pallete;
  }

  AppBar header(Color color, String head) {
    AppBar appbar = AppBar(
      backgroundColor: color,
      shadowColor: Colors.black,
      toolbarHeight: 40,
      elevation: 0,
      centerTitle: true,
      title: Text(
        head,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
    return appbar;
  } 

  Flexible flextext(
      String text, Color textcolor, FontWeight fontweight, double fontsize) {
    Flexible flextext = Flexible(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        strutStyle: const StrutStyle(fontSize: 12.0),
        text: TextSpan(
            style: TextStyle(
                color: textcolor, fontWeight: fontweight, fontSize: fontsize),
            text: text),
      ),
    );
    return flextext;
  }

  VerticalDivider verdiv(
      Color divcolor, double indent, double endindent, double thickofit) {
    VerticalDivider verdiv = VerticalDivider(
      color: divcolor,
      indent: indent,
      endIndent: endindent,
      thickness: thickofit,
    );
    return verdiv;
  }

  Container marketcard(String photopath) {
    Container contents = Container(
        height: 130,
        width: 161,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              photopath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.home_work_rounded, size: 15),
                        Materials().verdiv(const Color.fromRGBO(66, 66, 66, 1), 1, 1, 0.5),
                        Materials().flextext('Nama Toko atau Jasa.', Colors.black,
                            FontWeight.bold, 11),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            size: 15,
                            color: Colors.grey,
                          ),
                          Materials().verdiv(const Color.fromRGBO(189, 189, 189, 1), 2, 1,
                              0.5),
                          Center(
                            child: Materials().flextext('Nama Kecamatan.', Colors.grey,
                                FontWeight.bold, 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
    return contents;
  }
  
}
