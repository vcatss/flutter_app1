import 'package:app2/model/home_page/destination_model.dart';
import 'package:app2/modules/home/home_detail.dart';
import 'package:app2/modules/home/home_top_list.dart';
import 'package:app2/modules/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walkieTalkie,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.walkieTalkie,
    FontAwesomeIcons.bicycle,
  ];

  Widget _buiderIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? HexColor("#2155CD")
                : HexColor('#E7EBEE'),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(_icons[index],
              size: 15,
              color: _selectedIndex == index
                  ? HexColor('#ffffff')
                  : HexColor("2155CD"))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EEEEEE'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120),
              child: Text('What would you like to find ?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )),
            ),
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buiderIcon(map.key))
                    .toList()),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Top destinations',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      )),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print('see all');
                    },
                    child: Text('See all',
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor("#2155CD"),
                          letterSpacing: 1.0,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            HomeTop(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Top 2',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      )),
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print('see all');
                    },
                    child: Text('See all',
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor("#2155CD"),
                          letterSpacing: 1.0,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
