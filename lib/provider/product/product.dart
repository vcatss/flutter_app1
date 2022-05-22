import 'package:get/get.dart';
import 'package:dio/dio.dart' as dioclass;
import '../../main.dart';

class ProductProvider extends GetConnect {
  // Get request
  // ignore: non_constant_identifier_names
  Future<Response> GetTopProduct() {
    return get('https://api.e-gate.vn/api/product/getAll');
  }
}

class Shopee1Provider extends GetConnect {
  Controller c = Get.find();
  final String cookie = "";

  Future<dioclass.Response> sendCookie(String cookie) async {
    var response = await c.dioInstance.post(
      '/api/tporder/shopee/sendCookie',
      data: {'cookie': cookie},
    );
    return response;
  }
}
