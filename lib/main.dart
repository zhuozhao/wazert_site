import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wazert_site/pages/login_page.dart';

import 'account_model.dart';
import 'main_tab_page.dart';

void main() {
  final accountModel = AccountModel();

  runApp(ChangeNotifierProvider<AccountModel>.value(
    value: accountModel,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网泽工地',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'mainTabpage':(context)=>MainTabPage(),
        'loginPage':(context)=>LoginPage(),
      },
      home: MainTabPage(),
    );
  }
}
