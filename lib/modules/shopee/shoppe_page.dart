import 'dart:async';
import 'dart:io';
import 'package:app2/modules/shopee/shopee_order_list.dart';
import 'package:dio/dio.dart' as dioclass;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../provider/product/product.dart';
import '../../provider/shopee.dart';
import '../main/main_page.dart';

class ShoppePage extends StatefulWidget {
  const ShoppePage({Key? key}) : super(key: key);

  @override
  State<ShoppePage> createState() => _ShoppePageState();
}

class _ShoppePageState extends State<ShoppePage> {
  final cookieManager = WebviewCookieManager();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final shopeeProvider = ShopeeProvider();

  void getCookies() async {
    final gotCookies = await cookieManager.getCookies('https://shopee.vn');
    String cookie = "";
    for (var item in gotCookies) {
      cookie += item.name + "=" + item.value + ";";
    }
    //await shopeeProvider.sendCookie(cookie);
    await shopeeProvider.getAllOrder(cookie);
    Get.to(const ShopeeOrdersPage());
    //print(response.data);
    //if (response.statusCode == 200) Get.to(const MainPage());
  }

  @override
  void initState() {
    super.initState();

    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    //getCookies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            getCookies();
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: WebView(
            userAgent: Platform.isIOS
                ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15' +
                    ' (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
                : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) ' +
                    'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
            initialUrl: 'https://shopee.vn/buyer/login',
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print('WebView is loading (progress : $progress%)');
            },
            onPageFinished: (String url) {
              if (url == "https://shopee.vn/") {
                getCookies();
              }
            },
            gestureNavigationEnabled: true,
            javascriptMode: JavascriptMode.unrestricted));
  }
}
