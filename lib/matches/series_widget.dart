import 'package:flutter/cupertino.dart';
import 'package:expertgg/matches/series.dart';
import 'package:expertgg/matches/egaming_icon.dart';

class SeriesList extends StatelessWidget {
  final _seriesList = List.filled(
    20,
    Series(
      tournament: '2018 Korea King Pro League Fall',
      competitors: [
        Competitor(
          name: 'ROX PHOENIX',
          logo: 'https://img.abiosgaming.com/casters/rox-phoenix.png',
          score: null,
        ),
        Competitor(
          name: 'ROX PHOENIX',
          logo: 'https://img.abiosgaming.com/casters/rox-phoenix.png',
          score: null,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      child: ListView.builder(
        shrinkWrap: true,
        itemExtent: 100.0,
        itemBuilder: (context, index) {
          var series = _seriesList[index];
          return SeriesItem(series: series);
        },
        itemCount: _seriesList.length,
      ),
    );
  }
}

class SeriesItem extends StatelessWidget {
  final Series series;

  SeriesItem({this.series});

  @override
  Widget build(BuildContext context) {
    final vs = Center(
      child: Text(
        'VS',
        style: TextStyle(
          color: CupertinoColors.white,
        ),
      ),
    );

    return Container(
      // height: 100,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Color.fromRGBO(16, 18, 22, 0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EgamingIcon(image: series.competitors.first.logo),
          vs,
          EgamingIcon(image: series.competitors.last.logo)
        ],
      ),
    );
  }
}
