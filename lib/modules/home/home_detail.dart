import 'package:app2/modules/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../../model/home_page/product.dart';

class Detail extends StatefulWidget {
  final ProductModel? model;
  const Detail(this.model, {Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Image myImage;
  final formatCurrency = NumberFormat("#,##0", "vi_VI");

  @override
  void initState() {
    super.initState();
    myImage = Image.asset(widget.model!.image![0]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#EEEEEE"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  tag: 'hero-${widget.model!.sId}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(widget.model!.image![0],
                        fit: BoxFit.cover),
                  ),
                ),
              )
            ]),
            Text(widget.model!.productName!),
            Text('${formatCurrency.format(widget.model!.productPrice!)} vnđ'),
            Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: HexColor('#2155CD')),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: HexColor('#2155CD'),
                            minimumSize: const Size(88, 36),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart,
                                  size: 24, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                  '${formatCurrency.format(widget.model!.productPrice!)} vnđ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  )),
                            ],
                          )))),
            ),
          ],
        ));
  }
}
