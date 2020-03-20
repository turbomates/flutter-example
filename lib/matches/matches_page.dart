import 'package:flutter/cupertino.dart';
import 'package:expertgg/matches/games_widget.dart';
import 'package:expertgg/matches/series_widget.dart';

class MatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: ListView(
        children: <Widget>[
          GamesList(),
          SeriesList(),
        ],
      ),
    );
  }
}
