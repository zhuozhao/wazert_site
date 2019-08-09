import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String version = '1.0.0';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      print(packageInfo.version);
      setState(() {
        version = packageInfo.version;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('版本更新'),
          subtitle: Text('当前版本：V$version'),
          trailing: Icon(Icons.keyboard_arrow_right),
          isThreeLine: false,
          dense: true,
          enabled: true,
          onTap: () {},
        ),
        Divider(
          height: 1,
        ),
        Card(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '公司：浙江网泽科技有限公司',
              ),
              GestureDetector(
                child: Text(
                  '网址：http://www.51gps.net',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  _launchURL('http://www.51gps.net');
                },
              ),
              Text('电话：4008128881'),
              Text('地址：杭州市拱墅区莫干山路972号泰家园E座6层'),
            ],
          ),
        ))
      ],
    );
  }

  _launchURL(url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
