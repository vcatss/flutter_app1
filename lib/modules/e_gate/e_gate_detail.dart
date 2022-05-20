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
  bool isSwitched2 = false;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: const [
                                    Text('Front Door',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white))
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: const [
                                    Text('Back Door',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white))
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Switch(
                                  value: isSwitched2,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched2 = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            Column(
              children: [Row()],
            ),
          ],
        ));
  }
}
