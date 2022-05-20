import 'package:get/get.dart';

class ProductProvider extends GetConnect {
  // Get request
  // ignore: non_constant_identifier_names
  Future<Response> GetTopProduct() {
    return get('https://api.e-gate.vn/api/product/getAll');
  }
}
