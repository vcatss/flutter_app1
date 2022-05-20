import 'package:app2/model/home_page/destination_model.dart';
import 'package:app2/modules/home/home_detail.dart';
import 'package:app2/modules/main/main_page.dart';
import 'package:app2/provider/product/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../model/home_page/product.dart';

class HomeTop extends StatefulWidget {
  HomeTop({Key? key}) : super(key: key);

  @override
  State<HomeTop> createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  HomeController c = Get.find();

  Future<List<ProductModel>> loadData() async {
    ProductProvider pp = ProductProvider();
    var response = await pp.GetTopProduct();
    var dataJson = response.body["result"]["table"]["rows"] as List;
    c.listProduct = dataJson.map((p) => ProductModel.fromJson(p)).toList();
    return dataJson
        .map((p) => ProductModel.fromJson(p))
        .toList()
        .take(20)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(), // a previously-obtained Future<String> or null
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            SizedBox(
              height: 290,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    ProductModel model = snapshot.data![index];
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
                          child:
                              Stack(alignment: Alignment.topCenter, children: <
                                  Widget>[
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${model.productName}',
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              letterSpacing: 1.2)),
                                      Text(model.productName ?? "n/a",
                                          style: const TextStyle(
                                            fontSize: 13,
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
                                      child: CachedNetworkImage(
                                        imageUrl: model.image![0],
                                        height: 180,
                                        width: 180,
                                        placeholder: (context, url) => Image.asset(
                                            'assets/images/picture-loading.gif'),
                                        // progressIndicatorBuilder: (context, url,
                                        //         downloadProgress) =>
                                        //     CircularProgressIndicator(
                                        //         value:
                                        //             downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      // child: FadeInImage.assetNetwork(
                                      //     placeholder:
                                      //         'assets/images/picture-loading.gif',
                                      //     image: model.image![0],
                                      //     height: 180,
                                      //     width: 180,
                                      //     fit: BoxFit.cover),
                                      // Image.network(
                                      //   model.image!.isEmpty
                                      //       ? 'https://znews-photo.zingcdn.me/w660/Uploaded/mfsy2/2022_04_26/ava_dj_soda.jpg'
                                      //       : ,
                                      //   height: 180,
                                      //   width: 180,
                                      //   fit: BoxFit.cover,
                                      //   errorBuilder:
                                      //       (context, error, stackTrace) {
                                      //     return Image.asset(
                                      //         '',
                                      //         fit: BoxFit.cover);
                                      //   },
                                      // ),
                                    ),
                                  ),
                                ]))
                          ])),
                    );
                  }),
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final HomeController c = Get.find();
  //   return SizedBox(
  //       height: 300,
  //       // color: Colors.blue,
  //       child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: destinations.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             ProductModel model = c.listProduct[index];
  //             return GestureDetector(
  //               onTap: () {
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //       builder: (context) => NavigationScreen(const Detail())),
  //                 // );
  //                 Get.to(Detail(index));
  //               },
  //               child: Container(
  //                   width: 210,
  //                   margin: const EdgeInsets.all(10.0),
  //                   // color: Colors.red,
  //                   child: Stack(
  //                       alignment: Alignment.topCenter,
  //                       children: <Widget>[
  //                         Positioned(
  //                           bottom: 15.0,
  //                           child: Container(
  //                             height: 120,
  //                             width: 200,
  //                             decoration: BoxDecoration(
  //                                 color: Colors.white,
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 boxShadow: const [
  //                                   BoxShadow(
  //                                       color: Colors.black26,
  //                                       offset: Offset(0.0, 2.0),
  //                                       blurRadius: 6.0)
  //                                 ]),
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Column(
  //                                 mainAxisAlignment: MainAxisAlignment.end,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: <Widget>[
  //                                   Text('${model.productName} activities',
  //                                       style: const TextStyle(
  //                                           fontSize: 16.0,
  //                                           fontWeight: FontWeight.w600,
  //                                           color: Colors.black,
  //                                           letterSpacing: 1.2)),
  //                                   Text(model.productName ?? "n/a",
  //                                       style: const TextStyle(
  //                                         fontSize: 14,
  //                                         color: Colors.black45,
  //                                       ))
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Container(
  //                             decoration: BoxDecoration(
  //                                 color: Colors.white,
  //                                 borderRadius: BorderRadius.circular(20.0),
  //                                 boxShadow: const [
  //                                   BoxShadow(
  //                                       color: Colors.black26,
  //                                       offset: Offset(0.0, 2.0),
  //                                       blurRadius: 6.0)
  //                                 ]),
  //                             child: Stack(children: <Widget>[
  //                               Hero(
  //                                 tag: 'hero-$index',
  //                                 child: ClipRRect(
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   child: Image.network(
  //                                       'https://znews-photo.zingcdn.me/w660/Uploaded/mfsy2/2022_04_26/ava_dj_soda.jpg',
  //                                       height: 180,
  //                                       width: 180,
  //                                       fit: BoxFit.cover),
  //                                 ),
  //                               ),
  //                             ]))
  //                       ])),
  //             );
  //           }));
  // }
}
