import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wazert_site/beans/account_info_entity.dart';
import '../account_model.dart';
import 'login_page.dart';

///我的页面
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final _accountModel = Provider.of<AccountModel>(context);
    AccountInfoEntity accountInfoEntity = _accountModel.accountInfo;
    String userName = "未登录";
    String account = "";
    bool login = false;
    if (accountInfoEntity != null) {
      login = true;
      userName = accountInfoEntity.username;
      account = accountInfoEntity.account;
    }

    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('$userName'),
          leading: Icon(Icons.account_circle, size: 45, color: Colors.blue),
          subtitle: Text('账号：$account'),
          trailing: Icon(Icons.keyboard_arrow_right),
          isThreeLine: false,
          dense: true,
          enabled: true,
          onTap: () {
            if (accountInfoEntity == null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        ),
        Divider(height: 1),
        Offstage(
          offstage: !login,
          child: Container(
            height: 45,
            margin: EdgeInsets.all(10),
            child: FlatButton(
              child: Text('退出', style: TextStyle(color: Colors.white)),
              color: Colors.red,
              onPressed: () {
                _accountModel.setAccounInfo(null);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
