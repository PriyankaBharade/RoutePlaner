import 'package:flutter/material.dart';

import 'package:routeplan/order_reciept.dart';
import 'package:routeplan/bookings/bookings.dart';

import 'package:routeplan/route_plan.dart';
import 'package:routeplan/signup_screen.dart';
import 'package:routeplan/welcome_screen.dart';
import 'package:routeplan/order_screen.dart';
import 'package:routeplan/reciept_history.dart';
import 'package:routeplan/bottom_navigation/navigation.dart';
import 'login_screen.dart';

void main() {
 runApp(MyApplication());
}


class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "My Application",
    home : WelcomeScreen(),
    /*  theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          cardColor: Colors.black,
          indicatorColor: Colors.white),
      home: Navigation(), */
    // home : MyHomePage(),
   //  home : JsonSpinner(),
     routes: <String,WidgetBuilder>{
    '/login':(BuildContext context) => new LoginScreen() ,
    '/SignUp':(BuildContext context) => new SignUpScreen(),
    '/Order':(BuildContext context) => new OrderScreen(),
    '/RoutePlan':(BuildContext context) => new RoutePlan(),
    '/OrderReciept':(BuildContext context) => new OrderReciept(),
    '/RecieptHistory':(BuildContext context) => new RecieptHistory() ,
    '/bookings':(BuildContext context)=>new Bookings(),
    '/navigation':(BuildContext context)=>new Navigation(),
   },
    );
  }
}

// class Splash extends StatefulWidget{
//   @override
//    _SplashScreenState createState() => new _SplashScreenState();
// }


// class _SplashScreenState extends State<Splash> {
//   startTime() async {
//     var _duration = new Duration(seconds: 3);
//     return new Timer(_duration, navigationPage);
//   }

//   void navigationPage() {
//     Navigator.of(context).pushReplacementNamed('/LoginScreen');
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Image.asset('images/splash.jpeg'),
//       ),
//     );
//   }
// }