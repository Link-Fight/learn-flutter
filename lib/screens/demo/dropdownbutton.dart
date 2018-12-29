import 'package:flutter/material.dart';

class DropdownbuttonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DropdownbuttonState();
  }
}

class DropdownbuttonState extends State<DropdownbuttonPage> {
  List<DropdownMenuItem<String>> _dropdownmenitems;
  String _selectedval;
  @override
  void initState() {
    _dropdownmenitems = buildAndGetDropDownMenItems(
        ["Apple", "Banana", "Pineapple", "Mango", "Grapes"]);
    _selectedval = _dropdownmenitems[0].value;
    super.initState();
  }

  void onChangeValue(value) {
    setState(() {
      _selectedval = value;
    });
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenItems(List list) {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in list) {
      items.add(new DropdownMenuItem(
        value: item,
        child: Text('$item'),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownButton'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('DropDownButton'),
            leading: Icon(Icons.pin_drop),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: DropdownButton(
              items: _dropdownmenitems,
              value: _selectedval,
              onChanged: (result) {
                print(result);
                onChangeValue(result);
              },
            ),
          )
        ],
      ),
    );
  }
}
