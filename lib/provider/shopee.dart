import 'package:app2/model/shopee/order.dart';
import 'package:dio/dio.dart' as dioclass;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ShopeeProvider extends GetConnect {
  var dio = dioclass.Dio();
  ShopeeController controller = Get.find();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<dioclass.Response> sendCookie(String cookie) async {
    print(cookie);
    dio.options.headers.addAll({'cookie': cookie});
    var response = await dio.get(
        'https://shopee.vn/api/v4/order/get_order_detail?order_id=106152091547679');
    print(response.data.toString());
    return response;
  }

  Future<dioclass.Response> getAllOrder(String cookie) async {
    final SharedPreferences prefs = await _prefs;
    dio.options.headers.addAll({'cookie': cookie});
    var response = await dio.get(
        'https://shopee.vn/api/v4/order/get_all_order_and_checkout_list?limit=20&offset=0');
    var list = response.data["data"]["order_data"]["details_list"] as List;
    var listData = list.map((p) => ShopeeOrders.fromJson(p)).toList();
    controller.listShopeeOrders = listData;
    return response;
  }
}
