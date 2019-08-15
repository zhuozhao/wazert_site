import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wazert_site/beans/account_info_entity.dart';

import '../account_model.dart';

///车辆里程查询
class CarMilePage extends StatefulWidget {
  @override
  _CarMilePageState createState() => _CarMilePageState();
}

class _CarMilePageState extends State<CarMilePage> {



  DateTime startDate = DateTime.now().subtract(new Duration(days: 7));
  String startDateStr = '';
  DateTime endDate = DateTime.now();
  String endDateStr = '';

  List<AccountInfoCompanysCar> _cars = [];

  int initialItemCompany =0;
  int initialItemCar =0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDateStr = formatDate(startDate, [yyyy, '-', mm, '-', dd]);
    endDateStr = formatDate(endDate, [yyyy, '-', mm, '-', dd]);
  }

  @override
  Widget build(BuildContext context) {

    final _accountModel = Provider.of<AccountModel>(context);
    AccountInfoEntity accountInfoEntity = _accountModel.accountInfo;


    setState(() {
      //_cars = accountInfoEntity.companys[0].cars;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("里程查询"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {


            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('车辆选择'),
                trailing: Text('未选择'),
                onTap: () {
                  showCupertinoModalPopup(context: context, builder: (context){

                    return SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: 250,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                FlatButton(onPressed: () {}, child: new Text('取消')),
                                FlatButton(onPressed: () {}, child: new Text('确定')),
                              ],
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoPicker(
                                        key: ValueKey(initialItemCompany),
                                        backgroundColor: Colors.white,
                                        itemExtent: 35,
                                        useMagnifier: false,
                                        scrollController: FixedExtentScrollController(initialItem: initialItemCompany),
                                        onSelectedItemChanged: (position){
                                          setState(() {
                                            initialItemCompany = position;
                                            _cars = accountInfoEntity.companys[position].cars;

                                          });
                                          print('position:$position');
                                        },
                                        children: List<Widget>.generate(accountInfoEntity.companys.length,(index){

                                          return Center(
                                            child: Text(accountInfoEntity.companys[index].companyname,style: TextStyle(fontSize: 20),),
                                          );
                                        })
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoPicker(
                                        key: ValueKey(initialItemCar),
                                        backgroundColor: Colors.white,
                                        itemExtent: 35,
                                        scrollController: FixedExtentScrollController(initialItem: initialItemCar),
                                        onSelectedItemChanged: (position){
                                          setState(() {
                                            initialItemCar = position;
                                          });
                                          print('position:'+_cars[position].buslicplate);
                                        },
                                        children: List<Widget>.generate(_cars.length,(index){

                                          return Center(
                                            child: Text(_cars[index].buslicplate,style: TextStyle(fontSize: 20),),
                                          );
                                        })
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('开始日期'),
                trailing: Text('$startDateStr'),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      currentTime: startDate,
                      maxTime: DateTime.now(),
                      locale: LocaleType.zh, onConfirm: (date) {
                    setState(() {
                      startDate = date;
                      startDateStr = formatDate(date, [yyyy, '-', mm, '-', dd]);
                    });
                  });
                },
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('截止日期'),
                trailing: Text('$endDateStr'),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      currentTime: endDate,
                      maxTime: DateTime.now(),
                      locale: LocaleType.zh, onConfirm: (date) {
                    setState(() {
                      endDate = date;
                      endDateStr = formatDate(date, [yyyy, '-', mm, '-', dd]);
                    });
                  });
                },
              ),
              Divider(height: 1),
              SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text(
                        '查询',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  )),
            ],
          )),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.green,
              height: 200,
            ),
            Container(
              color: Colors.red,
              height: 200,
            ),
            Container(
              color: Colors.black12,
              height: 200,
            ),
            Container(
              color: Colors.blue,
              height: 200,
            ),
            Container(
              color: Colors.yellow,
              height: 200,
            ),
          ]))
        ],
      ),
    );
  }
}
