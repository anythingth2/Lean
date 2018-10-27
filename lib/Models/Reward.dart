class RewardTile {
  String title;
  List<Reward> rewards;

  RewardTile(this.title,this.rewards);
}

class Reward {
  String logo;
  String image;
  int fromPrice;
  int toPrice;
  Reward(this.logo,this.image,this.fromPrice,this.toPrice);
}
