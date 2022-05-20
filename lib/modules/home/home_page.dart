import 'dart:convert';

import 'package:app2/model/home_page/destination_model.dart';
import 'package:app2/model/home_page/product.dart';
import 'package:app2/modules/home/home_detail.dart';
import 'package:app2/modules/home/home_top_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../model/home_page/news_model.dart';
import '../../provider/product/product.dart';

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

  Widget _builderListNews(int index) {
    News newModel = news[index];
    return Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        decoration: const BoxDecoration(),
        child: SizedBox(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0)
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network('${newModel.image}',
                        height: double.infinity, width: 120),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          SizedBox(
                              // color: Colors.blue,
                              height: 25,
                              child: Row(children: [
                                Text('${newModel.title}',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                      // letterSpacing: 0.4,
                                      // fontFamily: 'Roboto',
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                    ))
                              ])),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                '${newModel.description}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                softWrap: false,
                                style: const TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 13.0,
                                  letterSpacing: 0.3,
                                  // fontFamily: 'Roboto',
                                  color: Colors.black45,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }

  loadProduct() async {
    final HomeController c = Get.find();
    var response = await ProductProvider().GetTopProduct();
    var list = response.body["result"]["table"]["rows"] as List;
    var itemsList = list.map((i) => ProductModel.fromJson(i)).toList();
    c.listProduct = itemsList;
    print(c.listProduct);
  }

  @override
  initState() {
    loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

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
                      c.increment();
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
                  const Text('News',
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
                  ),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround, children: [])
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
