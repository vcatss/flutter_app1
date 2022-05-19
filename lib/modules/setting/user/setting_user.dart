import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../app_sign_in/sign_in_page.dart';

class SettingUserPage extends StatelessWidget {
  const SettingUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Controller c = Get.find();
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản và bảo mật"),
        backgroundColor: HexColor('#2155CD'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: false,
        children: <Widget>[
          Card(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Column(
                        children: const [
                          Text('Đổi số điện thoại',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87))
                        ],
                      ),
                      const SizedBox(height: 5),
                      Column(
                        children: const [
                          Text('(+84) 923270070',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54))
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text('Lịch sử đăng nhập',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87))
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text('Đổi mật khẩu',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
          Card(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Xác thực 2 lớp',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87)),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {},
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Column(
                        children: const [
                          Text(
                              'Chúng tôi sẽ yêu cầu mã kích hoạt khi tài khoản của bạn được đăng nhập trên một thiết bị lạ',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54))
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text('Đặt mã khoá màn hình',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
          Card(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          Text('Xoá tài khoản',
                              style: TextStyle(fontSize: 15, color: Colors.red))
                        ],
                      ),
                      const SizedBox(height: 5),
                      Column(
                        children: const [
                          Text('Tài khoản của bạn sẽ xoá trong 7 ngày',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
