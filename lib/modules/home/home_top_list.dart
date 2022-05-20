import 'package:app2/model/home_page/destination_model.dart';
import 'package:app2/modules/home/home_detail.dart';
import 'package:app2/modules/main/main_page.dart';
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
  loadData() async {}

  @override
  void initState() {
    final HomeController c = Get.find();
    print(c.listProduct.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find();
    return Container();
  }
}
