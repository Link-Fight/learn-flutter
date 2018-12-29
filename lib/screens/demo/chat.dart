import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

final ThemeData iOSTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColor: Colors.grey[400],
    primaryColorBrightness: Brightness.dark);

final ThemeData androidTheme =
    new ThemeData(primaryColor: Colors.blue, accentColor: Colors.green);

const String defaultUserName = 'LINK';

class ChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartState();
  }
}

class _ChartState extends State<ChartPage> with TickerProviderStateMixin {
  final List<_MsgItem> _messages = <_MsgItem>[];
  final TextEditingController _textEditingController =
      new TextEditingController();
  bool _isWriting = false;

  void _submitMsg(String txt) {
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
    _MsgItem msg = new _MsgItem(
        txt: txt,
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 800)));
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration.collapsed(hintText: '说点啥'),
                onSubmitted: _submitMsg,
                onChanged: (String txt) {
                  setState(() {
                    _isWriting = txt.length > 0;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              child: IconButton(
                  icon: Icon(Icons.message),
                  onPressed: _isWriting
                      ? () => _submitMsg(_textEditingController.text)
                      : null),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (_MsgItem msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('极飞云聊天室'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: EdgeInsets.all(6.0),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            child: _buildComposer(),
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
          )
        ],
      ),
    );
  }
}

class _MsgItem extends StatelessWidget {
  _MsgItem({this.txt, this.animationController});
  final String txt;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 18.0),
              child: CircleAvatar(
                child: Text(defaultUserName[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$defaultUserName',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6.0),
                    child: Text(txt),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
