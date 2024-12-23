import 'package:flutter/material.dart';
import 'materials.dart';
import 'detailcard.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  @override
  Widget build(BuildContext context){
    return Padding(
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

            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, size: 40),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'nama profil',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('089043981224'),
                    ],
                  ),
                ],
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
            return GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailCard()),
                  );
                });
                },
              child:  SizedBox(
              height: 130,
              child: Materials().marketcard('images/pict-toko.png'),
            ),
            );
          }),
    );
    return container;
  }
}