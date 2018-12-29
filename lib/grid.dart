import 'package:flutter/material.dart';

List<Container> _buildGridTileList(int count) {
  return List<Container>.generate(
      count,
      (int index) => Container(
            child: Image.network(
                'https://static.xag.cn/img/product/20180601/0C04AD54DE8ADE02155D6E949F4F98B2.jpg'),
          ));
}

Widget buildGrid() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}
