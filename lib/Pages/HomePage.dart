import 'package:flutter/material.dart';
import 'package:lean/Util.dart';
import 'package:lean/DataRepository.dart';
import 'package:lean/Models/Models.dart';

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
            color: Colors.red,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
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
              Container(
                height: 512.0,
                child: TabBarView(
                  controller: this.tabController,
                  children:
                      List.generate(DataRepository.rewardTiles.length, (i) {
                    List<Reward> rewards =
                        DataRepository.rewardTiles[i].rewards;
                    return Column(
                      children: rewards
                          .map<Widget>((reward) => Container(
                                height: 100,
                                child: Text('${reward.fromPrice}'),
                              ))
                          .toList(),
                    );
                  }),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
