import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../main.dart';

class EGateDetail extends StatefulWidget {
  const EGateDetail({Key? key}) : super(key: key);

  @override
  State<EGateDetail> createState() => _EGateDetailState();
}

class _EGateDetailState extends State<EGateDetail> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: HexColor("#2153A0"),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://data.thuviengiaoandientu.com/?explorer/share/file&hash=7906FkiAv3slIOmb75N-_lLuDQ7jVfeW8CKwSoaodr32cdUvrxn8gftVewZgKikf_0IV"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://data.thuviengiaoandientu.com/?explorer/share/file&hash=d48diGTBxmSMCBCXfMqnvED_qdCqQbT5nCJfqak5PszaFk5O8tbe_CGhzkwnBrjXQB5n'),
            Column(
              children: [
                Row(
                  children: [
                    const Text('Front Door',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Xác thực 2 lớp',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87)),
                                      Switch(
                                        value: isSwitched,
                                        onChanged: (value) {},
                                        activeTrackColor:
                                            Colors.lightGreenAccent,
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
                                            fontSize: 13,
                                            color: Colors.black54))
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
                                            fontSize: 15,
                                            color: Colors.black87))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
            Column(
              children: [Row()],
            ),
          ],
        ));
  }
}
