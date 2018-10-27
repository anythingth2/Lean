import 'package:flutter/material.dart';
import 'package:lean/Util.dart';
import 'package:lean/DataRepository.dart';
import 'package:lean/Models/Models.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Tab tabBuilder(String title) => Tab(
        text: title,
      );
  TabController tabController;

  Widget rewardBuilder(Reward reward) => GestureDetector(
        onTap: () {
          Util.router.goCoupon(context, reward);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            height: 128,
            child: Row(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    reward.logo,
                    width: 32,
                    height: 32,
                  ),
                ),
                Image.asset(
                  reward.image,
                  width: 64,
                  height: 64,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('${reward.fromPrice}'),
                      Text('${reward.toPrice}')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lean'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                Util.router.goObjectDetection(context);
              },
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text('นาย รักษ์โลก'),
                  decoration: BoxDecoration(color: Colors.green),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: Text(
                'Reward',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            TabBar(
              labelColor: Colors.black,
              controller: this.tabController,
              tabs: List.generate(DataRepository.rewardTiles.length,
                  (i) => tabBuilder(DataRepository.rewardTiles[i].title)),
            ),
            Expanded(
              child: TabBarView(
                controller: this.tabController,
                children: List.generate(DataRepository.rewardTiles.length, (i) {
                  List<Reward> rewards = DataRepository.rewardTiles[i].rewards;
                  return ListView(
                    children: rewards.map<Widget>(rewardBuilder).toList(),
                    shrinkWrap: true,
                  );
                }),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
