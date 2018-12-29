import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [0, 1, 2, 3, 4].map((int index) {
                return Icon(
                  Icons.star,
                  color: Colors.red,
                );
              }).toList()),
          Text(
            '2024 人次',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 12.0),
          )
        ],
      ),
    );
  }
}

Widget _myCard() {
  return SizedBox(
    height: 210.0,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('极飞科技', style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('推动全球农业智能化'),
            leading: Icon(Icons.toys, color: Colors.red[500]),
          ),
          Divider(),
          ListTile(
            title: Text('(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );
}

class _CheckboxState extends State<CheckboxDemo> {
  bool _value = false;
  void _onChange(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.yellow[900],
        child: Row(
          children: <Widget>[
            Checkbox(
              onChanged: _onChange,
              value: _value,
            ),
            Text('A')
          ],
        ));
  }
}

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxState createState() => _CheckboxState();
}

Widget _pageDetail() {
  return Container(
    padding: const EdgeInsets.all(32.0),
    child: Text(
      '''
热爱技术，相信科技可以改变生活改变世界，并以此对待产品理念、工业设计和用户体验，要求苛刻且追求完美，是我们对极客精神的理解。顶得住压力，耐得住寂寞，专注于科研，不惧怕改变，对社会抱有强烈的责任感，是我们对极客精神的诠释。
        ''',
      softWrap: true,
    ),
  );
}

Widget _checkboxList() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      CheckboxDemo(),
      CheckboxDemo(),
      CheckboxDemo(),
    ],
  );
}

Widget _pageHeaderImg(context) {
  return Container(
    constraints: BoxConstraints.expand(
      height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
    ),
    padding: const EdgeInsets.all(8.0),
    color: Colors.teal.shade700,
    alignment: Alignment.center,
    child: Text('Hello World',
        style:
            Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
    foregroundDecoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            'https://static.xag.cn/img/product/20180601/0C04AD54DE8ADE02155D6E949F4F98B2.jpg'),
        centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
      ),
    ),
    transform: Matrix4.rotationZ(0.1),
  );
}

class _PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(
          content: Text('看我的'),
          action: SnackBarAction(
            label: '好看吗?',
            onPressed: () {},
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: _pageHeaderImg(context),
    );
  }
}

Widget _myDrawerHeader() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Expanded(
        child: Stack(
          alignment: const Alignment(0.6, 0.6),
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
              radius: 40.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Text('Link',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )
          ],
        ),
      ),
      Expanded(
        flex: 3,
        child: ListTile(
          title: Text(
            '柯琳',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w800),
          ),
          subtitle: Text(
            '日复一日',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

class _FavoriteWidge extends StatefulWidget {
  final double size;
  _FavoriteWidge({Key key, this.size: 16.0}) : super(key: key);
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<_FavoriteWidge> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited
                ? Icon(
                    Icons.star,
                    size: widget.size,
                  )
                : Icon(
                    Icons.star_border,
                    size: widget.size,
                  )),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

class FirstScreen extends StatelessWidget {
  void _onPree(BuildContext context) {
    Navigator.pushNamed(context, '/second');
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '推动全球农业智能化',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '© 2005-2018 极飞科技 保留所有权利。',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          _FavoriteWidge(
            size: 24,
          ),
        ],
      ),
    );
    Column builBottomColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    Widget bottomSection;
    bottomSection = Container(
      child: Row(
        children: <Widget>[
          builBottomColumn(Icons.call, 'CALL'),
          builBottomColumn(Icons.near_me, 'ROUTE'),
          builBottomColumn(Icons.share, 'SHARE')
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              color: Colors.white70,
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                _onPree(context);
              },
            ),
          ],
          title: Text('极飞科技'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: _myDrawerHeader(),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              ListTile(
                  title: Text('选择图片'),
                  onTap: () {
                    Navigator.pushNamed(context, '/pickerImages');
                  }),
              ListTile(
                title: Text('tabBar页面'),
                onTap: () {
                  Navigator.pushNamed(context, '/tab');
                },
              ),
              ListTile(
                title: Text('设备'),
                onTap: () {
                  Navigator.pushNamed(context, '/device');
                },
              ),
              ListTile(
                title: Text('Demo'),
                onTap: () {
                  Navigator.pushNamed(context, '/demo');
                },
              ),
              ListTile(
                title: Text('底部导航：bottomNavigator'),
                onTap: () {
                  Navigator.pushNamed(context, '/bottomNavigator');
                },
              ),
              AboutListTile(
                icon: Icon(Icons.description),
                child: Text('data'),
                applicationName: '小程序',
                applicationVersion: '1.0.0',
              )
            ],
          ),
        ),
        body: ListView(children: <Widget>[
          _PageHeader(),
          _checkboxList(),
          _myCard(),
          ListTile(
            leading: const Icon(Icons.sms_failed),
            title: const Text('XAG'),
            subtitle: const Text(
              '2018 XAAG,GuangZhou',
              style: TextStyle(fontSize: 12),
            ),
            trailing: Text('2018/12/5'),
          ),
          Container(
            padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
            child: Image.asset('images/logo.png',
                height: 120.0, fit: BoxFit.contain),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.red),
              borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [1, 2, 3].map(
                (int index) {
                  String url = index == 2
                      ? 'https://static.xag.cn/img/product/20180601/0C04AD54DE8ADE02155D6E949F4F98B2.jpg'
                      : 'https://static.xag.cn/img/product/20181214/E2E5FFABD00488398047EC1817F2F02A.jpg';
                  return Expanded(
                    flex: index == 2 ? 2 : 1,
                    child: Container(
                        child: Image.network(url, height: 100, width: 100)),
                  );
                },
              ).toList(),
            ),
          ),
          titleSection,
          Ratings(),
          bottomSection,
          _pageDetail(),
        ]));
  }
}
