import 'package:app2/modules/e_gate/e_gate_detail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../main.dart';
import '../main/main_page.dart';

class EGatePage extends StatefulWidget {
  const EGatePage({Key? key}) : super(key: key);

  @override
  State<EGatePage> createState() => _EGatePageState();
}

class _EGatePageState extends State<EGatePage>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#0000000'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "Đây là cái popup",
              style: TextStyle(fontSize: 24.0),
            ),
            content: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: HexColor('#2155CD'),
          child: const Icon(Icons.home, size: 24, color: Colors.white),
          onPressed: () {
            Get.to(const MainPage());
            _animationController.reset();
            _animationController.forward();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            HexColor('#2155CD'),
            Colors.blue,
          ],
        )),
        child: ListView(
          padding: const EdgeInsets.only(left: 8, right: 9, top: 30),
          shrinkWrap: false,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const EGateDetail());
              },
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
                child: Card(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://znews-photo.zingcdn.me/w210/Uploaded/qfssu/2022_05_18/casinhatbanrikakoinouedongphimnguoilon3_3545.jpeg',
                          height: 80),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 35,
                                              right: 35,
                                              top: 2,
                                              bottom: 2),
                                          child: Text('Egate',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12)),
                                        ),
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 35,
                                              right: 35,
                                              top: 2,
                                              bottom: 2),
                                          child: Row(children: const [
                                            Icon(
                                              Icons.wifi,
                                              size: 14,
                                              color: Colors.white,
                                            )
                                          ]),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text('Đây là 1 sản phẩm rất kì lạ',
                                        style: TextStyle(
                                          fontSize: 13,
                                          letterSpacing: 0.1,
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 35,
                                              right: 35,
                                              top: 2,
                                              bottom: 2),
                                          child: Row(children: const [
                                            Text('Controls',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ))
                                          ]),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: Card(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://znews-photo.zingcdn.me/w210/Uploaded/qfssu/2022_05_18/casinhatbanrikakoinouedongphimnguoilon3_3545.jpeg',
                        height: 80),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 35,
                                            right: 35,
                                            top: 2,
                                            bottom: 2),
                                        child: Text('Egate',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12)),
                                      ),
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 35,
                                            right: 35,
                                            top: 2,
                                            bottom: 2),
                                        child: Row(children: const [
                                          Icon(
                                            Icons.wifi,
                                            size: 14,
                                            color: Colors.white,
                                          )
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: Text('Đây là 1 sản phẩm rất kì lạ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        letterSpacing: 0.1,
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0.0, 2.0),
                                              blurRadius: 6.0,
                                            )
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 35,
                                            right: 35,
                                            top: 2,
                                            bottom: 2),
                                        child: Row(children: const [
                                          Text('Controls',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ))
                                        ]),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
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
