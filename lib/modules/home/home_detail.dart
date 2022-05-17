import 'package:app2/modules/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detail extends StatefulWidget {
  final int? index;
  const Detail(this.index, {Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    print('Index[${widget.index}]');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#EEEEEE"),
        body: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Hero(
                  tag: 'hero-${widget.index}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                        'https://znews-photo.zingcdn.me/w660/Uploaded/mfsy2/2022_04_26/ava_dj_soda.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              )
            ])
          ],
        ));
  }
}
