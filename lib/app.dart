import 'package:dpbo_cig/kursus_list.dart';
import 'package:dpbo_cig/login.dart';
import 'package:dpbo_cig/market.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'materials.dart';
import 'profile.dart';
import 'kursus.dart';
import 'form_add_course.dart';
import 'form_add_market.dart';
import 'controller/user.dart';


class Home extends StatefulWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _FooterState();
}

class _FooterState extends State<Home> {
  int _curidx = 0;
  List<Color> pallete = Materials().getFootColors();
  

  @override
  Widget build(BuildContext context) {
    List<Widget> bods =  [
    Dashboard(user: widget.user),
      KursusList(userId: widget.user.id!,),
      MarketList(userId: widget.user.id!,),
    ProfilePage(user: widget.user,)
  ];

    List<dynamic> addbtn = [
      null,
      FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddCourseForm())),
        tooltip: 'Add Course',
        child: const Icon(Icons.add),
      ),
      FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddMarketForm())),
        tooltip: 'Add Market',
        child: const Icon(Icons.add),
      ),
      null
    ];

    List<AppBar> appbars = [
      Materials().header(pallete[0], 'DASHBOARD'),
      Materials().header(pallete[1], 'KURSUS'),
      Materials().header(pallete[2], 'MARKET'),
      Materials().header(pallete[3], 'PROFILE')
    ];

    return Scaffold(
      appBar: appbars[_curidx],
      body: bods[_curidx],
      floatingActionButton: addbtn[_curidx],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
            icon: Icon(Icons.school_rounded),
            label: 'Kursus',
            backgroundColor: Color(0xFF808080),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded),
            label: 'Market',
            backgroundColor: Color(0xFF9c9c9c),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Akun',
            backgroundColor: Color(0xFF808080),
          ),
        ],
      ),
    );
  }
}
