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

  Padding bodydashboard() {
    Padding body = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0,
                )
              ]),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 40,
                      child: const IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            VerticalDivider(
                              color: Colors.black,
                              indent: 12,
                              endIndent: 12,
                              thickness: 0.1,
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.filter_alt_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    iconColor: Colors.grey[900],
                    hintText: 'Search Bramastullah',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1000),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      'Rekomendasi Market',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 10),
                    appslider(),
                    const SizedBox(height: 20),
                    const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      'Rekomendasi Dana',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 10),
                    appslider(),
                    const SizedBox(height: 20),
                    const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      'Rekomendasi Kursus',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 10),
                    appslider(),
                    const SizedBox(height: 20),
                  ]),
            ),
          ],
        ),
      ),
    );
    return body;
  }

  Container appslider() {
    Container container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      height: 130,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 130,
              child: marketcard('images/pict-toko.png'),
            );
          }),
    );
    return container;
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
                        verdiv(const Color.fromRGBO(66, 66, 66, 1), 1, 1, 0.5),
                        flextext('Nama Toko atau Jasa.', Colors.black,
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
                          verdiv(const Color.fromRGBO(189, 189, 189, 1), 2, 1,
                              0.5),
                          Center(
                            child: flextext('Nama Kecamatan.', Colors.grey,
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
}
