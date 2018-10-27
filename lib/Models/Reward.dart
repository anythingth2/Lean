class RewardTile {
  String title;
  List<Reward> rewards;

  RewardTile(this.title, this.rewards);
}

class Reward {
  String logo;
  String image;
  String name;
  int fromPrice;
  int toPrice;
  String period;
  Reward(this.logo, this.image, this.name, this.fromPrice, this.toPrice,
      this.period);
}
