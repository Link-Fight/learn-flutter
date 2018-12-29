import 'package:flutter/material.dart';
import 'menber/serve.dart';
import 'menber/device.dart';
import 'menber/user.dart';

class BottomNavigatorPage extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorPage> {
  String _curTab = '';
  List<String> tabsList = [];
  PageController _controller;
  void _onChangeTab(String tab) {
    _controller.animateToPage(tabsList.indexOf(tab),
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    setState(() {
      _curTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < _tablist.length; i++) {
      tabsList.add(_tablist[i].key);
    }
    _controller = PageController(initialPage: 0);
    final pageView = PageView(
      controller: _controller,
      children: <Widget>[MenberServe(), MenberDevice(), MenberUser()],
      onPageChanged: (int index) {
        print(index);
        setState(() {
          _curTab = tabsList[index];
        });
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text('底部导航页面')),
      body: pageView,
      floatingActionButton: _FloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _tablist.map((item) {
              return Expanded(
                child: _TabBarItem(
                    onPress: _onChangeTab,
                    color: _curTab == item.key
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    tab: item),
              );
            }).toList()),
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({Key key, this.onPress, this.color, this.tab})
      : super(key: key);
  final Function onPress;
  final Color color;
  final _Tab tab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(tab.key);
        onPress(tab.key);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Theme.of(context).dividerColor))),
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              tab.icon,
              size: 24,
              color: color,
            ),
            Text(
              '${tab.title}',
              style: TextStyle(fontSize: 12.0, color: color),
            )
          ],
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: Icon(Icons.add),
      onPressed: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("干嘛点我？"),
          action: SnackBarAction(
            label: "点错咯!",
            onPressed: () {},
          ),
        ));
      },
    );
  }
}

class _Tab {
  const _Tab({this.key, this.icon, this.title});
  final IconData icon;
  final String title;
  final String key;
}

const List<_Tab> _tablist = const <_Tab>[
  const _Tab(title: '服务', key: 'serve', icon: Icons.verified_user),
  const _Tab(title: '设备', key: 'device', icon: Icons.devices),
  const _Tab(title: '我的', key: 'user', icon: Icons.person)
];
