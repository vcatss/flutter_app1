import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  // ignore: non_constant_identifier_names
  Future<Response> SignIn(String username, String password) {
    return post('https://api.e-gate.vn/api/mobile/auth/login',
        {"email": username, "password": password});
  }
}
