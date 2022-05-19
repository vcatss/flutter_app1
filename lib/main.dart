import 'package:app2/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modules/app_sign_in/sign_in_page.dart';
import 'modules/main/main_page.dart';

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
  increment() => count++;
}

class MyApp extends StatelessWidget {
  MyApp(this.page, {Key? key}) : super(key: key);

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    Controller c = Get.find();
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
