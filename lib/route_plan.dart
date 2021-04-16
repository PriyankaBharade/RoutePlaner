import 'package:flutter/material.dart';

class RoutePlan extends StatelessWidget {
   @override
 Widget build(BuildContext context) {
   var stack = Stack(
            children: [
            Padding(padding: EdgeInsets.only(top:5),
            child : Align(alignment: Alignment.centerRight,
            child :Image.asset('images/splash.jpeg', width: 30,height: 30))),
            Padding(padding: EdgeInsets.only(right: 30),
            child: GestureDetector(
            onTap: () => {
            Navigator.of(context).pushNamed('/RoutePlan')},
            child : Container(
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
            )
           ),
            )
            ]);
      return Scaffold(
        body: ListView(
         padding: EdgeInsets.all(10.0),
          children: [
           //  Top Header Bar
           Stack(
             alignment: Alignment.centerLeft,
             children: [
             Text('Book' ,style: TextStyle(fontFamily: 'Roboto',fontSize: 20,color: Color(0xFF000000))),
             Padding(padding: EdgeInsets.only(left: 0),
             child : Center(
             child : Image.asset('images/splash.jpeg', width: 100,height: 110),)
             )]),
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
                     Padding(padding: EdgeInsets.all(8),
                     child : Expanded(
                     flex: 4,
                     child: Text('Recipient Name',style: TextStyle(color: Color(0xFF000000),
                     fontFamily: 'RobotoRegular'))
                   )),
                   Expanded(
                     flex: 6,
                     child: TextField(
                     keyboardType: TextInputType.name,
                     style: TextStyle(color: Color(0xFF000000),
                     fontSize: 12,
                     fontFamily: 'RobotoRegular'),
                     decoration: InputDecoration(
                     labelText: 'name',
                     isDense: true,                      // Added this
                     contentPadding: EdgeInsets.all(8)))
                   )
                   ],
                ),
                Row(
                   children: [
                     Padding(padding: EdgeInsets.all(8),
                     child : Expanded(
                     flex: 4,
                     child: Text('Contact               ',style: TextStyle(color: Color(0xFF000000),
                     fontFamily: 'RobotoRegular'))
                   )),
                   Expanded(
                     flex: 6,
                     child: TextField(
                     keyboardType: TextInputType.name,
                     style: TextStyle(color: Color(0xFF000000),
                     fontSize: 12,
                     fontFamily: 'RobotoRegular'),
                     decoration: InputDecoration(
                     labelText: 'contact number',
                     isDense: true,                      // Added this
                     contentPadding: EdgeInsets.all(8)))
                   )])])),
           //  Address Schedule Ride Card
           Card(
              elevation: 5,
              color: Color(0xFFFFFFFF),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(children: [
               Padding(padding: EdgeInsets.all(8),
                 child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Text('Your Address' , style: TextStyle(fontFamily: 'Roboto',color: Color(0xFF000000))),
                 Row(
                   children: [
                    Padding(padding: EdgeInsets.only(right: 5.0),
                    child: Image.asset('images/splash.jpeg', width: 20,height: 20)),
                    Align(
                       alignment: Alignment.topRight,
                       child: Image.asset('images/splash.jpeg', width: 20,height: 20),
                     )
                   ])
                   ]),
                 ),
               Padding(padding:EdgeInsets.all(8),
                 child: Stack(
                   children: [
                    Padding(padding: EdgeInsets.only(top: 15),
                     child : Align(
                     alignment: Alignment.centerLeft,
                     child :Image.asset('images/splash.jpeg', width: 20,height: 20),
                      )),
                      Padding(padding: EdgeInsets.only(left: 30),
                      child: TextField(keyboardType: TextInputType.name,
                      style: TextStyle(color: Color(0xFF000000),
                      fontSize: 12,
                      fontFamily: 'RobotoRegular'),
                      decoration: InputDecoration(
                      labelText: 'contact number',
                      isDense: true)))
                   ]
                 )),
               Padding(padding: EdgeInsets.only(top: 30),
               child: Text('Schedule a Ride' ,style: TextStyle(fontFamily: 'Roboto',fontSize: 20,color: Color(0xFF000000))),
               ),
               Padding(padding: EdgeInsets.only(top: 30),
               child: Text('Thu, Apr 8' ,style: TextStyle(fontFamily: 'RobotoRegular',fontSize: 18,color: Color(0xFF000000))),
               ),
               Padding(padding: EdgeInsets.only(top: 30),
               child: Text('8:35 PM - 8:45 PM' ,style: TextStyle(fontFamily: 'RobotoRegular',fontSize: 18,color: Color(0xFF000000))),
               ),
              ])
            ),
            Padding(padding: EdgeInsets.only(top: 30),
            child: stack)
       ],
     )
   );
 }
}