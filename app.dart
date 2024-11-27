import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodydashboard(),
    );
  }
}

AppBar header(Color color) {
  AppBar appbar = AppBar(
    backgroundColor: color,
    shadowColor: Colors.black,
    toolbarHeight: 40,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'CIG APP',
      style: TextStyle(
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
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

Container appslider(){
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
                        child: marketcard(),
                      );
                    }),
              );
  return container;
}

Container marketcard() {
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
            'images/pict-toko.png',
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
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.home_work_rounded, size: 15),
                        ),
                        VerticalDivider(
                          color: Colors.grey[800],
                          indent: 1,
                          endIndent: 1,
                          thickness: 0.5,
                        ),
                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(fontSize: 12.0),
                            text: const TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                                text: 'Nama Toko atau Jasa.'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.location_on_rounded,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.grey[400],
                                indent: 2,
                                endIndent: 1,
                                thickness: 0.5,
                              ),
                              Center(
                                child: Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: const StrutStyle(fontSize: 12.0),
                                    text: const TextSpan(
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                        text: 'Nama Kecamatan.'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ]));
  return contents;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _FooterState();
}

class _FooterState extends State<Home> {
  int _curidx = 0;
  List<Color> pallete = const [
    Color(0xFF575757),
    Color(0xFF808080),
    Color(0xFF9c9c9c),
    Color(0xFF808080),
    Color(0xFF575757),
  ];
  List<Widget> bods = const [
    Dashboard(),
    Text(
      'Under\nMaintenance...',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    Text(
      'Under\nMaintenance...',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    Text(
      'Under\nMaintenance...',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    Text(
      'Under\nMaintenance...',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(pallete[_curidx]),
      body: Center(
        child: bods[_curidx],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int newidx) {
          setState(() {
            _curidx = newidx;
          });
        },
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: _curidx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Beranda',
            backgroundColor: Color(0xFF575757),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded),
            label: 'Market',
            backgroundColor: Color(0xFF808080),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Dana',
            backgroundColor: Color(0xFF9c9c9c),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: 'Kursus',
            backgroundColor: Color(0xFF808080),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Akun',
            backgroundColor: Color(0xFF575757),
          ),
        ],
      ),
    );
  }
}
