import 'package:flutter/material.dart';

class DevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: items.map((item) {
      return ListTile(
        title: Text('${item.title}'),
        leading: Icon(item.icon),
        trailing: Icon(item.icon),
      );
    }).toList()));
  }
}

class Item {
  const Item({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Item> items = const <Item>[
  const Item(title: 'CAR', icon: Icons.directions_car),
  const Item(title: 'BICYCLE', icon: Icons.directions_bike),
  const Item(title: 'BOAT', icon: Icons.directions_boat),
  const Item(title: 'BUS', icon: Icons.directions_bus),
  const Item(title: 'TRAIN', icon: Icons.directions_railway),
  const Item(title: 'WALK', icon: Icons.directions_walk),
];
