class Series {
  String tournament;
  List<Competitor> competitors;

  Series({this.tournament, this.competitors});
}

class Competitor {
  String name;
  String logo;
  int score;

  Competitor({this.name, this.logo, this.score});
}
