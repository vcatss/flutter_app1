import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../app_sign_in/sign_in_page.dart';
import 'user/setting_user.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Controller c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tùy chỉnh"),
        backgroundColor: HexColor('#2155CD'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: false,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Get.to(const SettingUserPage());
            },
            child: Card(
                child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://s120-ava-talk.zadn.vn/e/d/3/8/24/120/7f57acf6d11a98193f3ba30a8c0d5b1a.jpg'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: const [Text('Nam')],
                  ),
                  Column(
                    children: const [
                      Text('Xem trang cá nhân',
                          style: TextStyle(fontSize: 13, color: Colors.black54))
                    ],
                  )
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: width / 3.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.balance,
                          size: 30,
                          color: Colors.indigo,
                        ),
                        SizedBox(height: 10),
                        Text('100.000.000 vnd',
                            style: TextStyle(color: Colors.black54))
                      ]),
                ),
                Container(
                  height: 80,
                  width: width / 3.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.outbox_rounded,
                          size: 30,
                          color: Colors.indigo,
                        ),
                        SizedBox(height: 10),
                        Text('5 hoá đơn',
                            style: TextStyle(color: Colors.black54))
                      ]),
                ),
                Container(
                  height: 80,
                  width: width / 3.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.production_quantity_limits,
                          size: 30,
                          color: Colors.indigo,
                        ),
                        SizedBox(height: 10),
                        Text('1 thiết bị',
                            style: TextStyle(color: Colors.black54))
                      ]),
                ),
              ],
            ),
          ),
          const Divider(
            height: 10,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.black12,
          ),
          Card(
              child: ListTile(
            leading: const Icon(
              Icons.security,
              size: 30,
              color: Colors.indigo,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    Text('Bảo mật',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54))
                  ],
                ),
                const Divider(
                  height: 6,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                  color: Colors.black12,
                ),
                Column(
                  children: const [
                    Text('Chỉnh sửa quyền hệ thống',
                        style: TextStyle(fontSize: 13, color: Colors.black54))
                  ],
                )
              ],
            ),
          )),
          Card(
              child: ListTile(
            leading: const Icon(
              Icons.support_agent,
              size: 30,
              color: Colors.indigo,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    Text('Hỗ trợ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54))
                  ],
                ),
                const Divider(
                  height: 6,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                  color: Colors.black12,
                ),
                Column(
                  children: const [
                    Text('Gửi yêu cầu hỗ trợ cá nhân',
                        style: TextStyle(fontSize: 13, color: Colors.black54))
                  ],
                )
              ],
            ),
          )),
          Card(
              child: ListTile(
            leading: const Icon(
              Icons.policy_outlined,
              size: 30,
              color: Colors.indigo,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    Text('Chính sách',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54))
                  ],
                ),
                const Divider(
                  height: 6,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                  color: Colors.black12,
                ),
                Column(
                  children: const [
                    Text('Chính sách hệ thống',
                        style: TextStyle(fontSize: 12, color: Colors.black54))
                  ],
                )
              ],
            ),
          )),
          GestureDetector(
            onTap: () async {
              await c.storage.write(key: "token", value: "");
              Get.to(SignInPage());
            },
            child: Card(
                child: ListTile(
              leading: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.indigo,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: const [
                      Text('Đăng xuất',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54))
                    ],
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Colors.black12,
                  ),
                  Column(
                    children: const [
                      Text('Đăng xuất khỏi thế giới ảo',
                          style: TextStyle(fontSize: 12, color: Colors.black54))
                    ],
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
