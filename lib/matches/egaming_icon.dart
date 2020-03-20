import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EgamingIcon extends StatelessWidget {
  final String image;

  EgamingIcon({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: CachedNetworkImage(
        placeholder: CircularProgressIndicator(),
        imageUrl: image,
        errorWidget: new Icon(Icons.error),
      ),
    );
  }
}
