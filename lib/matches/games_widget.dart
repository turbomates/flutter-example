import 'package:flutter/cupertino.dart';
import 'package:expertgg/matches/game.dart';
import 'package:expertgg/matches/egaming_icon.dart';

class GamesList extends StatelessWidget {
  final games = [
    Game('dota2', 'https://img.abiosgaming.com/games/round-dota-logo.png'),
    Game('lol', 'https://img.abiosgaming.com/games/round-lol-logo.png'),
    Game('cs:go', 'https://img.abiosgaming.com/games/round-cs-logo.png'),
    Game('hon', 'https://img.abiosgaming.com/games/round-hon-logo.png'),
    Game('sc2', 'https://img.abiosgaming.com/games/round-sc2-logo.png'),
    Game('hs', 'https://img.abiosgaming.com/games/round-hearthstone-logo.png'),
    Game('wow', 'https://img.abiosgaming.com/games/round-wow-logo.png'),
    Game('smite', 'https://img.abiosgaming.com/games/round-smite-logo.png'),
    Game('hots', 'https://img.abiosgaming.com/games/round-hots-logo.png'),
    Game('smash', 'https://img.abiosgaming.com/games/round-ssb-smash-logo.png'),
    Game('cod',
        'https://img.abiosgaming.com/games/flat-round-call-of-duty-logo.png'),
    Game('ow',
        'https://img.abiosgaming.com/games/flat-overwatch-logo-round.png'),
    Game('sc', 'https://img.abiosgaming.com/games/starcraft-circular-logo.png'),
    Game('kog',
        'https://img.abiosgaming.com/games/king-of-glory-circular-icon-v2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    var gamesListView =
        games.map((game) => EgamingIcon(image: game.image)).toList();

    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: gamesListView,
      ),
    );
  }
}
