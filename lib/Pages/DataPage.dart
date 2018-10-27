import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quiver/async.dart';

class DataPage extends StatefulWidget {
  Widget data;
  DataPage(this.data);
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  Duration start;
  @override
  void initState() {
    super.initState();
    Stream<CountdownTimer> stream =
        CountdownTimer(Duration(seconds: 5), Duration(seconds: 1));

    start = Duration(seconds: 5);
    stream.forEach((count) {
      setState(() {
        start -= Duration(seconds: 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: <Widget>[
          Text('${start.inSeconds}'),
          widget.data,
        ],
      ),
    );
  }
}
