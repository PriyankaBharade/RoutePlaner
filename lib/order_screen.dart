import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
   return Scaffold(
  body: ListView(
       padding: EdgeInsets.all(10.0),
       children: <Widget> [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
          Text('Book' ,style: TextStyle(fontFamily: 'Roboto',fontSize: 20,color: Color(0xFF000000))),
          Padding(padding: EdgeInsets.only(left: 0),
          child : Center(
          child : Image.asset('images/splash.jpeg', width: 100,height: 110),)
          )],),
        Card(
          elevation: 5,
          color: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0),
           ),
          child: Column(children: <Widget>[
            Row(
              children: [
               Padding(padding: EdgeInsets.all(8),
               child : Expanded(
                  flex: 4,
                  child: Text('Recipient Name',style: TextStyle(color: Color(0xFF000000),
                  fontFamily: 'RobotoRegular'))
                )
                ),
                Flexible(
              //  child : Padding(padding: EdgeInsets.all(8),
                child :Expanded(
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
               // )
                )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(8),
                child :Expanded(
                  flex: 5,
                  child: Text('Contact',style: TextStyle(color: Color(0xFF000000),fontFamily: 'RobotoRegular'))
                )
                ),
                Flexible(
                child : Padding(padding: EdgeInsets.all(8),
                child :Expanded(
                  flex: 5,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Color(0xFF000000),
                    fontSize: 12
                  ,fontFamily: 'RobotoRegular'),
                  decoration: InputDecoration(
                  labelText: 'contact number',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8)))
                )
                )
                )
              ],
            )
          ],),
        ),
        Padding(padding: EdgeInsets.only(top: 10),
        child : Card(
          elevation: 5,
          color: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0),
           ),
           child : Column(children: [
           Padding(padding: EdgeInsets.all(8),
           child: Stack(
            alignment: Alignment.centerLeft,
             children: [
                Text('Your Address' , style: TextStyle(fontFamily: 'Roboto',color: Color(0xFF000000))),
                Align(
                alignment: Alignment.topRight,
                child : Image.asset('images/splash.jpeg', width: 20,height: 20))
             ]
           )
           ),
           Padding(padding: EdgeInsets.all(8),
           child: Row(
             children: [
               Expanded(
                 flex: 1,
                 child: Image.asset('images/splash.jpeg', width: 18,height: 18)),
               Expanded(
                 flex: 9,
                 child: TextField(
                 keyboardType: TextInputType.number,
                 style: TextStyle(color: Color(0xFF000000)
                 ,fontFamily: 'RobotoRegular',fontSize: 12),
                  decoration: InputDecoration(
                  labelText: 'Departure from here departure address',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8))))
             ],
           )
           ),
           Padding(padding: EdgeInsets.all(8),
           child: Row(
             children: [
               Expanded(
                 flex: 1,
                 child: Image.asset('images/splash.jpeg', width: 18,height: 18)),
               Expanded(
                 flex: 9,
                 child: TextField(
                 keyboardType: TextInputType.number,
                 style: TextStyle(color: Color(0xFF000000)
                 ,fontFamily: 'RobotoRegular',fontSize: 12),
                  decoration: InputDecoration(
                  labelText: 'Destination from here departure address',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8))))
             ])),
               Padding(padding: EdgeInsets.all(8),
               child: Text('*Fill your notes and requires' , style: TextStyle(fontFamily: 'Roboto',color: Color(0xFF4083BA))),
               )
             
           ])
          )
        ),
        Card(
          elevation: 5,
          color: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0)),
          child: Column(children: <Widget>[
            Row(
              children: [
               Padding(padding: EdgeInsets.all(8),
               child : Expanded(
                  flex: 4,
                  child: Text('Recipient Name',style: TextStyle(color: Color(0xFF000000),fontFamily: 'RobotoRegular'))
                )
                ),
                Flexible(
              //  child : Padding(padding: EdgeInsets.all(8),
                  child :Expanded(
                  flex: 6,
                  child: TextField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Color(0xFF000000),fontSize: 12,
                  fontFamily: 'RobotoRegular'),
                  decoration: InputDecoration(
                  labelText: 'name',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8)))
                )
               // )
                )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(8),
                child :Expanded(
                  flex: 5,
                  child: Text('Contact',style: TextStyle(color: Color(0xFF000000),fontFamily: 'RobotoRegular'))
                )
                ),
                Flexible(
                child : Padding(padding: EdgeInsets.all(8),
                child :Expanded(
                  flex: 5,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Color(0xFF000000),fontSize: 12
                  ,fontFamily: 'RobotoRegular'),
                  decoration: InputDecoration(
                  labelText: 'contact number',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8)))
                )
                )
                )
              ],
            )
          ])
        ),
        Card(
          child : Column(
          children: [
          Padding(padding: EdgeInsets.all(8),
          child:  Text('Auto Recommendation',style: TextStyle(color: Color(0xFF000000),fontFamily: 'Roboto'))
          ),
          Row(children: [
            Padding(padding: EdgeInsets.all(8),
            child : box1
            ),
            Padding(padding: EdgeInsets.all(8),
            child : box2
            ),
            Padding(padding: EdgeInsets.all(8),
            child : box3
            ),
          ],)
          ]
          )
        ),
        button
       ]
     )
   );
 }
}

Widget box1 = Container(
  // height: 150.0,
  // width: 50.0,
  color: Colors.transparent,
  child: Container(
  padding: EdgeInsets.all(8),
	decoration: BoxDecoration(
	color: Color(0xFF4ED281),
	borderRadius: BorderRadius.all(Radius.circular(10.0))),
	child: new Center(
	  child: new Text("7.8 miters", 
	  style: TextStyle(color: Colors.white, fontSize: 14),
	  textAlign: TextAlign.center,),
	)),
);

Widget box2 = Container(
  // height: 150.0,
  // width: 50.0,
  color: Colors.transparent,
  child: Container(
  padding: EdgeInsets.all(8),
	decoration: BoxDecoration(
	color: Color(0xFF4ED281),
	borderRadius: BorderRadius.all(Radius.circular(10.0))),
	child: new Center(
	  child: new Text("Platform", 
	  style: TextStyle(color: Colors.white, fontSize: 14),
	  textAlign: TextAlign.center,),
	)),
);


Widget box3 = Container(
  // height: 150.0,
  // width: 50.0,
  color: Colors.transparent,
  child: Container(
  padding: EdgeInsets.all(8),
	decoration: BoxDecoration(
	color: Color(0xFF4ED281),
	borderRadius: BorderRadius.all(Radius.circular(10.0))),
	child: new Center(
	  child: new Text("Van", 
	  style: TextStyle(color: Colors.white, fontSize: 14),
	  textAlign: TextAlign.center,),
	)),
);


Widget button = Container(
  // height: 150.0,
  // width: 50.0,
  margin: EdgeInsets.only(top: 20),
  color: Colors.transparent,
  child: Container(
  padding: EdgeInsets.all(10),
	decoration: BoxDecoration(
	color: Color(0xFF0080E2),
	borderRadius: BorderRadius.all(Radius.circular(10.0))),
	child: new Center(
	  child: new Text("Order now", 
	  style: TextStyle(color: Colors.white, fontSize: 14),
	  textAlign: TextAlign.center,),
	)),
);
