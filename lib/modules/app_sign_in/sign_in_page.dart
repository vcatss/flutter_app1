import 'package:alert/alert.dart';
import 'package:app2/widget/common/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../main.dart';
import '../../provider/auth/auth.dart';
import '../main/main_page.dart';

class SignInController extends GetxController {
  var txtError = ''.obs;
}

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  var txtUserNameController = TextEditingController();
  var txtPasswordController = TextEditingController();

  String? txtError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Time tracker'),
      //   elevation: 2.0,
      // ),
      body: _contentBuilder(context),
      backgroundColor: const Color(0xFFE8F9FD),
    );
  }

  LoaderOverlay _contentBuilder(BuildContext context) {
    final Controller c = Get.find();
    SignInController controller = Get.put(SignInController());
    return LoaderOverlay(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://congviec.ing.vn/assets/logo_ing.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: txtUserNameController,
                  decoration: InputDecoration(
                      hintText: 'Tài khoản',
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.clear))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: txtPasswordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Mật khẩu',
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Obx(() => Visibility(
                    visible:
                        controller.txtError.toString() != "" ? true : false,
                    child: Text("${controller.txtError}",
                        style: const TextStyle(
                          color: Colors.red,
                        )))),
                const SizedBox(height: 12),
                CustomButton(
                  border: 30,
                  color: Colors.white,
                  pressed: () async {
                    //Gia bo chech check cai j di
                    context.loaderOverlay.show();
                    UserProvider up = UserProvider();
                    final result = await up.SignIn(
                        txtUserNameController.text.toString(),
                        txtPasswordController.text.toString());
                    context.loaderOverlay.hide();
                    if (result.statusCode == 200) {
                      await c.storage.write(key: "token", value: "123");
                      final token = await c.storage.read(key: "token");
                      // ignore: avoid_print
                      print("Token: $token");
                      Get.off(const MainPage());
                      controller.txtError.value = "";
                    } else {
                      controller.txtError.value =
                          "Bạn đã nhập sai tài khoản/mật khẩu";
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Đăng nhập',
                        style: TextStyle(color: Colors.black45),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Hoặc với tài khoản',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black45)),
                const SizedBox(height: 10),
                CustomButton(
                  border: 30,
                  color: Colors.white,
                  pressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://data.thuviengiaoandientu.com/?explorer/share/file&hash=6d87i9KPdBBoj_a_NBRPGoAseNSAY6bd2R93IYexKIcboaRXqA-ACuk1WDiyht2tEzZ-',
                        height: 24,
                      ),
                      const Text('Đăng nhập với Google',
                          style: TextStyle(color: Colors.black45)),
                      Opacity(
                        opacity: 0,
                        child: Image.network(
                          'https://data.thuviengiaoandientu.com/?explorer/share/file&hash=6d87i9KPdBBoj_a_NBRPGoAseNSAY6bd2R93IYexKIcboaRXqA-ACuk1WDiyht2tEzZ-',
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
                CustomButton(
                  border: 30,
                  color: Colors.blue,
                  pressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://data.thuviengiaoandientu.com/?explorer/share/file&hash=2a85heZ06j6NypQKWbW6G-9PNztg_xExoVFU19lHGldJdySq9mAGMGsC8TreQL1QpNdY',
                        height: 24,
                      ),
                      const Text('Đăng nhập với Facebook',
                          style: TextStyle(color: Colors.white)),
                      Opacity(
                        opacity: 0,
                        child: Image.network(
                          'https://data.thuviengiaoandientu.com/?explorer/share/file&hash=2a85heZ06j6NypQKWbW6G-9PNztg_xExoVFU19lHGldJdySq9mAGMGsC8TreQL1QpNdY',
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
