import 'dart:convert';

import 'package:app2/model/shopee/order.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ShopeeOrdersPage extends StatefulWidget {
  const ShopeeOrdersPage({Key? key}) : super(key: key);

  @override
  State<ShopeeOrdersPage> createState() => _ShopeeOrdersPageState();
}

class _ShopeeOrdersPageState extends State<ShopeeOrdersPage> {
  ShopeeController controller = Get.find();

  Future<List<ShopeeOrders>> loadData() async {
    return controller.listShopeeOrders;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                  '${controller.listShopeeOrders[index]!.infoCard!.orderListCards![0].items![0].name}',
                  style: TextStyle(fontSize: 12, color: Colors.black));
            }));
  }
}
