import 'package:flutter/material.dart';
import 'package:wazert_site/pages/home_page.dart';
import 'package:wazert_site/pages/my_page.dart';
import 'package:wazert_site/pages/setting_page.dart';

///app主页
class MainTabPage extends StatefulWidget {
  @override
  _MainTabPageState createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("_MainTabPageState:initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网泽工地'),
        centerTitle: false,
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[MyPage(), HomePage(), SettingPage()],
        onPageChanged: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          fixedColor: Colors.blue,
          iconSize: 24,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.account_circle)),
            BottomNavigationBarItem(title: Text('主页'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(title: Text('设置'), icon: Icon(Icons.settings))
          ]),
    );
  }
}
