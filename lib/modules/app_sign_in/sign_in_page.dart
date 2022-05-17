import 'package:app2/widget/common/custom_raised_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Time tracker'),
      //   elevation: 2.0,
      // ),
      body: _contentBuilder(),
      backgroundColor: const Color(0xFFE8F9FD),
    );
  }

  Padding _contentBuilder() {
    return Padding(
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
            CustomButton(
              border: 30,
              color: Colors.white,
              pressed: () {},
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
        ));
  }
}
