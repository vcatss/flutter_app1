import 'package:app2/model/home_page/destination_model.dart';
import 'package:app2/modules/home/home_detail.dart';
import 'package:app2/modules/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTop extends StatefulWidget {
  HomeTop({Key? key}) : super(key: key);

  @override
  State<HomeTop> createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        // color: Colors.blue,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => NavigationScreen(const Detail())),
                  // );
                  Get.to(Detail(index));
                },
                child: Container(
                    width: 210,
                    margin: const EdgeInsets.all(10.0),
                    // color: Colors.red,
                    child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        '${destination.activities!.length} activities',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            letterSpacing: 1.2)),
                                    Text(destination.description ?? "n/a",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black45,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0)
                                  ]),
                              child: Stack(children: <Widget>[
                                Hero(
                                  tag: 'hero-$index',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                        'https://znews-photo.zingcdn.me/w660/Uploaded/mfsy2/2022_04_26/ava_dj_soda.jpg',
                                        height: 180,
                                        width: 180,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ]))
                        ])),
              );
            }));
  }
}
