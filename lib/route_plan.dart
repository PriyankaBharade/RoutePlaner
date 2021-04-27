import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ndialog/ndialog.dart';

class RoutePlan extends StatefulWidget {
  @override
  _RoutePlan createState() => _RoutePlan();
}

class _RoutePlan extends State<RoutePlan> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    var stack = Stack(children: [
      Padding(
          padding: EdgeInsets.only(top: 5),
          child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('images/splash.jpeg', width: 30, height: 30))),
      Padding(
        padding: EdgeInsets.only(right: 30),
        child: GestureDetector(
            onTap: () => {Navigator.of(context).pushNamed('/OrderReciept')},
            child: Container(
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFF0080E2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text("Order now",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center),
                  )),
            )),
      )
    ]);
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(10.0),
      children: [
        //  Top Header Bar
        Stack(alignment: Alignment.centerLeft, children: [
          Text('Book',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color(0xFF000000))),
          Padding(
              padding: EdgeInsets.only(left: 0),
              child: Center(
                child:
                    Image.asset('images/splash.jpeg', width: 100, height: 110),
              ))
        ]),
        //  Recipient Contact Card
        Card(
            elevation: 5,
            color: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Expanded(
                          flex: 4,
                          child: Text('Recipient Name',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'RobotoRegular')))),
                  Expanded(
                      flex: 6,
                      child: TextField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                              fontFamily: 'RobotoRegular'),
                          decoration: InputDecoration(
                              labelText: 'name',
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8))))
                ],
              ),
              Row(children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Expanded(
                        flex: 4,
                        child: Text('Contact               ',
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: 'RobotoRegular')))),
                Expanded(
                    flex: 6,
                    child: TextField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 12,
                            fontFamily: 'RobotoRegular'),
                        decoration: InputDecoration(
                            labelText: 'contact number',
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(8))))
              ])
            ])),
        //  Address Schedule Ride Card
        Card(
            elevation: 5,
            color: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your Address',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Color(0xFF000000))),
                      Row(children: [
                        Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Image.asset('images/splash.jpeg',
                                width: 20, height: 20)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset('images/splash.jpeg',
                              width: 20, height: 20),
                        )
                      ])
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Stack(children: [
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('images/splash.jpeg',
                              width: 20, height: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: TextField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 12,
                                fontFamily: 'RobotoRegular'),
                            decoration: InputDecoration(
                                labelText: 'contact number', isDense: true)))
                  ])),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Schedule a Ride',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Color(0xFF000000))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Thu, Apr 8',
                    style: TextStyle(
                        fontFamily: 'RobotoRegular',
                        fontSize: 18,
                        color: Color(0xFF000000))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text('8:35 PM - 8:45 PM',
                    style: TextStyle(
                        fontFamily: 'RobotoRegular',
                        fontSize: 18,
                        color: Color(0xFF000000))),
              ),
            ])),
        Padding(padding: EdgeInsets.only(top: 30), child: stack)
      ],
    ));
  }

  void callDetails(BuildContext context) async {
    showLoaderDialog(context, true);
    final SharedPreferences prefs = await _prefs;
    print(prefs.getString("order_id"));
    var url = Uri.parse('https://routplaner.com/api/getpacketorderdetails');
    Map<String, dynamic> user =
        jsonDecode(prefs.getString("user_data").toString());
    await http.post(url, body: {
      "customerId": user["customerId"],
      "accessToken": user["accessToken"],
      "orderId": prefs.getString("order_id"),
    }).then((response) {
      print(response.body);
      Navigator.pop(context);
    });
  }
}

void showLoaderDialog(BuildContext context, bool value) {
  CustomProgressDialog progressDialog = CustomProgressDialog(context, blur: 10);
  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red)));
  progressDialog.show();
}
