import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WelcomeScreen extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          print("Container clicked");
          callAPI(context);
        },
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Image.asset('images/splash.jpeg'),
            ),
            Container(
                child: Text(
              'Welcome to Addeur',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Color(0xff36B889), fontFamily: 'Roboto'),
            )),
            Container(
                margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Text(
                  'We strive to provide enterprises and individual an affordable, efficient and Echo-freindly medium-long distance logistics solutions! Also help our truckers earn more!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff000000),
                      fontFamily: 'RobotoRegular'),
                )),
          ],
        ),
      ),
    ));
  }

  void callAPI(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    print(prefs.getString("user_data"));
    if (prefs.getString("user_data") != null) {
      Map<String, dynamic> user =
          jsonDecode(prefs.getString("user_data").toString());
      if (user != null && user["customerId"] != "") {
       // Navigator.of(context).pushNamed('/Order');
        Navigator.pushNamedAndRemoveUntil(context, "/Order", (r) => false);
      } else {
      //  Navigator.of(context).pushNamed('/login');
       Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
      }
    }else{
    //  Navigator.of(context).pushNamed('/login');
      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
      
    }
  }
}
