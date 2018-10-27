import 'Models/Models.dart';

class DataRepository {
  static List<RewardTile> rewardTiles = <RewardTile>[
    RewardTile('อาหาร', <Reward>[
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Mac', 500, 200,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'KFC', 400, 105,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Pizza', 100, 50,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Silzzer', 100, 5,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Popcorn', 1410, 710,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Pizza', 240, 70,
          '1-31 Oct 2018'),
    ]),
    RewardTile('การเดินทาง', <Reward>[
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Grab', 4000, 2004,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Grab', 4010, 1405,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Uber', 12400, 2450,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'AllThaiTaxi', 14440,
          7024, '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Uber', 100, 50,
          '1-31 Oct 2018'),
      Reward('Assets/recycle.png', 'Assets/recycle.png', 'Uber', 140, 70,
          '1-31 Oct 2018'),
    ])
  ];

  static int coin = 135;
  static initilize() {}
}
