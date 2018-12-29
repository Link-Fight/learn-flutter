import 'package:flutter/material.dart';
import 'demo/dropdownbutton.dart';
import 'demo/chat.dart';

Widget _image = FadeInImage(
  placeholder: AssetImage('images/logo.png'),
  image:
      NetworkImage('https://static.xag.cn/img/2018/p20_2017/p20_2017_bg9.png'),
);

class _CurrentPage extends StatelessWidget {
  final List<String> _texts = ['下拉按钮', '聊天室'];
  final List<String> _urls = ['demo/dropdownbutton', 'demo/chat'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          title: Text('Demo 列表'),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('全村的希望'),
            background: Image.network(
              'https://static.xag.cn/img/2018/p20_2017/p20_2017_bg9.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 8.0),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.purple[100 * (index % 9)],
              child: Text('Grid'),
            );
          }, childCount: 9),
        ),
        SliverGrid.count(
            crossAxisCount: 4,
            children: List<Widget>.generate(8, (int index) => _image)),
        SliverList(
          delegate: SliverChildListDelegate([
            FadeInImage(
              placeholder: AssetImage('images/logo.png'),
              image: NetworkImage(
                  'https://static.xag.cn/img/2018/p20_2017/p20_2017_bg9.png'),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('是我'),
              trailing: Icon(Icons.add),
            )
          ]),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            String text = _texts[index % _texts.length];
            String url = _urls[index % _texts.length];
            return Container(
              child: ListTile(
                title: Text('$text'),
                onTap: () {
                  Navigator.pushNamed(context, url);
                },
              ),
            );
          }),
        )
      ],
    ));
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'demo/index',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'demo/index':
            builder = (BuildContext _) => _CurrentPage();
            break;
          case 'demo/dropdownbutton':
            builder = (BuildContext _) => DropdownbuttonPage();
            break;
          case 'demo/chat':
            builder = (BuildContext _) => ChartPage();
            break;
          default:
            builder = (BuildContext _) =>
                Container(child: Text('No Find:${settings.name}'));
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
