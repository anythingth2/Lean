import 'package:flutter/material.dart';
import 'package:lean/Models/Models.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:lean/Pages/Pages.dart';
import 'dart:async';
import 'package:quiver/async.dart';

class CouponPage extends StatefulWidget {
  Reward reward;

  CouponPage(this.reward);
  @override
  _CouponPageState createState() => _CouponPageState();
}

enum SelectionType { BarCode, QrCode, Code }

class _CouponPageState extends State<CouponPage> {
  Widget selectionBuilder(BuildContext context, String assetPath, String name,
          SelectionType type) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          this.onTapSelection(type);
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
            width: 64,
            height: 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  assetPath,
                  width: 32,
                  height: 32,
                ),
                Text(name)
              ],
            )),
      );

  void onTapSelection(SelectionType type) {
    Widget data;
    if (type == SelectionType.BarCode) {
      data = BarCodeImage(
        data: 'CHICHA',
        codeType: BarCodeType.Code39,
      );
    } else if (type == SelectionType.QrCode) {
      data = QrImage(
        data: 'ChiChaChai',
      );
    } else {
      data = Text(
        'ChiChaChai',
        style: TextStyle(fontSize: 24.0),
      );
    }

    showDialog(
        context: context,
        builder: (context) {
          

          return DataPage(data);
        });
  }

  void showRedeemDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Hello World'),
              content: Container(
                height: 128.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    selectionBuilder(
                      context,
                      'Assets/recycle.png',
                      'Barcode',
                      SelectionType.BarCode,
                    ),
                    selectionBuilder(context, 'Assets/recycle.png', 'QR Code',
                        SelectionType.QrCode),
                    selectionBuilder(context, 'Assets/recycle.png', 'Code',
                        SelectionType.Code),
                  ],
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
  }

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
                  onPressed: () {
                    showRedeemDialog();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
