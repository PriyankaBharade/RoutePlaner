import 'package:flutter/material.dart';
import 'package:routeplan/bookings/Ongoing/ongoing.dart';
import 'package:routeplan/bookings/history/history.dart';

class Bookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text(
                  'Ongoing',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  'History',
                  style: TextStyle(color: Colors.black),
                )),
              ],
            ),
            title: Container(
              child: Image.asset('images/splash.jpeg', width: 100, height: 100),
              margin: EdgeInsets.only(top: 10),
            ),
          ),
          body: TabBarView(
            children: [
              Ongoing(),
              History(context),
            ],
          ),
        ),
      ),
    );
  }
}
