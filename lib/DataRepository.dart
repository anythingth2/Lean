import 'Models/Models.dart';

class DataRepository {
  static List<RewardTile> rewardTiles = <RewardTile>[
    RewardTile('อาหาร', <Reward>[
      Reward('Assets/recycle.png', 'Assets/recycle.png', 500, 200),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 400, 105),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 100, 50),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 100, 50),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 1410, 710),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 240, 70),
    ]),
    RewardTile('การเดินทาง', <Reward>[
      Reward('Assets/recycle.png', 'Assets/recycle.png', 4000, 2004),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 4010, 1405),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 12400, 2450),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 14440, 7024),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 100, 50),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 140, 70),
    ])
  ];
  static initilize() {}
}
