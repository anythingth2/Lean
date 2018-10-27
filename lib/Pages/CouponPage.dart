import 'package:flutter/material.dart';
import 'package:lean/Models/Models.dart';

class CouponPage extends StatefulWidget {
  Reward reward;

  CouponPage(this.reward);
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reward.name),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: 128.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: double.infinity,
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        widget.reward.logo,
                        width: 64,
                        height: 64,
                      )),
                  Image.asset(
                    widget.reward.image,
                    width: 128,
                    height: 128,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1), bottom: BorderSide(width: 1))),
              child: Column(
                children: <Widget>[
                  Text(widget.reward.period),
                  Text('${widget.reward.fromPrice} to ${widget.reward.toPrice}')
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: RaisedButton(
                  padding: EdgeInsets.all(32.0),
                  child: Text('Redeem'),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
