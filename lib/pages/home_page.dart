import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:wazert_site/beans/FunctionMenu.dart';
import 'package:wazert_site/beans/account_info_entity.dart';

import '../account_model.dart';
import 'car_mile_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imagesUrl = [
    'http://183.129.194.99:8030/app_download/app_banner/home_banne1.png',
    'http://183.129.194.99:8030/app_download/app_banner/home_banne2.png',
    'http://183.129.194.99:8030/app_download/app_banner/home_banne3.png'
  ];

  List _gridMenus = [
    FunctionMenu(Icons.access_alarm, '送料监控'),
    FunctionMenu(Icons.account_circle, '砂浆监控'),
    FunctionMenu(Icons.settings, '到货统计'),
    FunctionMenu(Icons.print, '我的工地'),
    FunctionMenu(Icons.apps, '下单管理'),
    FunctionMenu(Icons.archive, '周边服务'),
    FunctionMenu(Icons.access_alarm, '送料监控'),
    FunctionMenu(Icons.account_circle, '砂浆监控'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _accountModel = Provider.of<AccountModel>(context);
    AccountInfoEntity accountInfoEntity = _accountModel.accountInfo;

    return Scaffold(
      //appBar: AppBar(title: Text("网泽工地"),),
      //backgroundColor: Colors.white10,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 160,
              child: Swiper(
                itemCount: _imagesUrl.length,
                autoplay: true,
                pagination: SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    _imagesUrl[index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 35,
              color: Colors.black12,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
              alignment: Alignment.centerLeft,
              child: Text(
                "工地服务",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //Grid按两列显示
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return Ink(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        if (accountInfoEntity == null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new LoginPage()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new CarMilePage()),
                          );
                        }
                      },
                      child: GridTile(
                          child: Icon(_gridMenus[index].getIcon(),
                              size: 32, color: Colors.lightBlue),
                          footer: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              _gridMenus[index].getName(),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  );
                },
                childCount: _gridMenus.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
