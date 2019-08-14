import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDateStr = formatDate(startDate, [yyyy, '-', mm, '-', dd]);
    endDateStr = formatDate(endDate, [yyyy, '-', mm, '-', dd]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("里程查询"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
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
                trailing: Text(''),
                onTap: () {

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
