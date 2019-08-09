import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wazert_site/beans/account_info_entity.dart';
import 'package:wazert_site/config/config.dart';
import 'package:wazert_site/widget/loading_dialog.dart';

import '../account_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  String account, password;
  bool _autovalidate = false; //表单自动验证
  TextEditingController accountController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Timer _timer ;
  String vldAccount(value) {
    if (value.isEmpty) {
      return '请输入账号';
    }
    return null;
  }

  String vldPassword(value) {
    if (value.isEmpty) {
      return '请输入密码';
    }
    return null;
  }

  _showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
              child: Container(
            width: 120,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitCircle(
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('加载中...')
              ],
            ),
          ));
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getLoginInfo();
    super.initState();
  }

  //获取账号密码
  _getLoginInfo() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String account = prefs.getString("account");
    String password = prefs.getString("password");
    accountController.text = account;
    pwdController.text = password;
  }


  @override
  Widget build(BuildContext context) {



    _buildEditWidget() {
      return Container(
        margin: EdgeInsets.all(16),
        child: TextFormField(
          onSaved: (value) {
            account = value;
          },
          validator: vldAccount,
          autovalidate: _autovalidate,
          controller: accountController,
          obscureText: false,
          decoration: InputDecoration(
              labelText: '账号',
              hintText: "请输入账号",
              prefixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder()),
        ),
      );
    }

    _buildPwdEditWidget() {
      return Container(
        margin: EdgeInsets.all(16),
        child: TextFormField(
          onSaved: (value) {
            password = value;
          },
          validator: vldPassword,
          autovalidate: _autovalidate,
          controller: pwdController,
          obscureText: true,
          decoration: InputDecoration(
              labelText: '密码',
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock),
              contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder()),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: loginFormKey,
            child: Column(
              children: <Widget>[
                _buildEditWidget(),
                _buildPwdEditWidget(),
              ],
            ),
          ),
          //登录按钮
          Container(
            margin: EdgeInsets.all(16),
            height: 45,
            child: FlatButton(
              child: Text(
                '登录',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                _login();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    accountController.dispose();
    pwdController.dispose();
    if(_timer!=null){
      _timer.cancel();
    }
    super.dispose();
  }

  void _login() {

    loginFormKey.currentState.save();

    if (!loginFormKey.currentState.validate()) {
      setState(() {
        _autovalidate = true;
      });
    } else {
      _showLoadingDialog();
      userLogin(account, password).then((accountInfo) {
        _saveLogin(account,password,accountInfo.toJson().toString());
        //关闭dialog
       Navigator.pop(context);
        final _accountModel = Provider.of<AccountModel>(context);

       if(accountInfo.resultcode=="1"){
         _accountModel.setAccounInfo(accountInfo);

         final snackBar = new SnackBar(content: new Text('登录成功'),backgroundColor: Colors.green,duration: Duration(milliseconds: 500));
         _scaffoldkey.currentState.showSnackBar(snackBar);

         _timer = Timer(const Duration(milliseconds: 500), (){
           Navigator.pop(context);
         });

       }else{
         final snackBar = new SnackBar(content: new Text('账号或密码错误'),backgroundColor: Colors.red,duration: Duration(seconds: 1));
         _scaffoldkey.currentState.showSnackBar(snackBar);
       }

      });
    }
  }

}

Future<AccountInfoEntity> userLogin(account, password) async {
  try {
    BaseOptions options = BaseOptions(
        method: 'post',
        baseUrl: Config.BASE_URL,
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        responseType: ResponseType.plain);

    Dio dio = Dio(options);
    Response response = await dio.post("/carjoint/logincs/gpsUserLogin",
        data: {"account": account, "password": password, "ispersonal": "0"});
    Map<String, dynamic> loginResultMap = json.decode(response.data.toString());

    AccountInfoEntity accountInfoEntity = AccountInfoEntity.fromJson(loginResultMap);

    return accountInfoEntity;
  } catch (e) {
    print(e);
    return null;
  }
}

//保存账号密码/登录返回的信息
_saveLogin(String account,String password,String userJson) async{

  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString("account", account);
  await prefs.setString("password", password);
  await prefs.setString("userJson", userJson);

}


