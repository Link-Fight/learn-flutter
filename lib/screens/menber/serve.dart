import 'package:flutter/material.dart';

class MenberServe extends StatelessWidget {
  final Widget head;

  const MenberServe({Key key, this.head}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            '全保计划',
            style: TextStyle(fontSize: 20),
          ),
          trailing: GestureDetector(
              onTap: () {
                print('保障记录');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text('保障记录'), Icon(Icons.chevron_right)],
              )),
        ),
        ListTile(
          title: Text('新建故障记录'),
          subtitle: Text('在线报修 | 非人为损坏,免费维修、回收'),
          trailing: Icon(Icons.crop),
        ),
        ListTile(
          title: Text('全保设备列表'),
          subtitle: Text('100架无人机'),
          trailing: Icon(Icons.list),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
        ListTile(
          title: Text('为其他设备购买全保服务'),
          subtitle: Text('免费维修，回收配件 | 赠送易损配件包'),
          trailing: Icon(Icons.card_giftcard),
        ),
      ],
    );
  }
}
