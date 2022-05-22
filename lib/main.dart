import 'package:app2/model/shopee/order.dart';
import 'package:app2/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'model/home_page/product.dart';
import 'modules/app_sign_in/sign_in_page.dart';
import 'modules/main/main_page.dart';
import 'package:dio/dio.dart' as dioclass;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var storage = const FlutterSecureStorage();
  var token = await storage.read(key: "token");
  print(token);
  if (token == "") {
    runApp(GetMaterialApp(home: MyApp(SignInPage())));
  } else {
    runApp(GetMaterialApp(home: MyApp(const MainPage())));
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  var storage = const FlutterSecureStorage();
  var dioInstance = dioclass.Dio();
  increment() => count++;
}

class HomeController extends GetxController {
  var storage = const FlutterSecureStorage();
  List<ProductModel> listProduct = [];
}

class ShopeeController extends GetxController {
  var storage = const FlutterSecureStorage();
  List<ShopeeOrders> listShopeeOrders = [];
}

class MyApp extends StatelessWidget {
  MyApp(this.page, {Key? key}) : super(key: key);

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    Get.put(HomeController());
    Get.put(ShopeeController(), permanent: true);
    Controller c = Get.find();
    c.dioInstance = dioclass.Dio(); // with default Options
    c.dioInstance.options.baseUrl = 'http://10.0.2.2:10006';
    c.dioInstance.options.connectTimeout = 5000; //5s
    c.dioInstance.options.receiveTimeout = 3000;
    c.dioInstance.options.headers.addAll({
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOnsiX2lkIjoiNjE2ODcwMjliOWI2ODYyMWY1M2RhMjYzIiwidXNlclR5cGUiOjEsImNvZGUiOm51bGwsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwiZnVsbG5hbWUiOiJUaOG7jWFpIFRo4buNYWkiLCJhdmF0YXIiOiJodHRwczovL2FwaS5lLWdhdGUudm4vaW1hZ2VzLzg4MzE1ZjJkLTU4OGYtNDA1OS04OWRmLTMwYjJiYzgxYWVjZi53ZWJwIiwiYWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIxLTEwLTE0VDE4OjAwOjA5Ljc2M1oiLCJpc19yb290Ijp0cnVlLCJyb2xlIjpudWxsfSwiaWF0IjoxNjUzMTY0MDU3LCJleHAiOjE2NTMxNzEyNTd9.P8uINdtL6OXIecTChfDJdd4BMO6WNjGf_2yCZLEn_rE'
    });
    return MaterialApp(
      title: 'Title',
      theme:
          ThemeData(primarySwatch: Colors.indigo, primaryColor: Colors.indigo),
      home: page,
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
