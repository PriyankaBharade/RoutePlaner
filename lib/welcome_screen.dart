import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
         child:  GestureDetector(
            onTap: () {
              print("Container clicked");
              Navigator.of(context).pushNamed('/login');
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
}
