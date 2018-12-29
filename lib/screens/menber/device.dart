import 'package:flutter/material.dart';

class MenberDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            '我的设备',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          title: Text('P10'),
          trailing: Text('20架'),
        ),
        ListTile(
          title: Text('P20'),
          trailing: Text('12架'),
        ),
        ListTile(
          title: Text('全保设备'),
          subtitle: Text('3架P10,3架P20'),
          trailing: Icon(Icons.list),
        ),
        ListTile(
          title: Text('您附近的授权网点'),
          trailing: Icon(Icons.card_giftcard),
        ),
      ],
    );
  }
}
