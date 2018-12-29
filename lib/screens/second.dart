import 'package:flutter/material.dart';

Widget _buildGrid() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}

List<Container> _buildGridTileList(int count) {
  return List<Container>.generate(
      count,
      (int index) => Container(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('images/boy.jpg',
                height: 120, width: 120, fit: BoxFit.contain),
          ));
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('SecodScreen'),
      ),
      body: _buildGrid(),
    );
  }
}
