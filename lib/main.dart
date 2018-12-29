import 'package:flutter/material.dart';

import 'screens/second.dart';
import 'screens/first.dart';
import 'screens/tab.dart';
import 'screens/device.dart';
import 'screens/bottomNavigator.dart';
import 'screens/demo.dart';
// import 'screens/pickerImages.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    theme: ThemeData(primarySwatch: Colors.red),
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
      '/tab': (context) => TabbedAppBarSample(),
      '/device': (context) => DevicePage(),
      '/bottomNavigator': (context) => BottomNavigatorPage(),
      '/demo': (context) => DemoPage()
      // '/pickerImages': (context) => PickerImagesPage()
    },
  ));
}
