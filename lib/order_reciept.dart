import 'package:flutter/material.dart';

class OrderReciept extends StatelessWidget{
   @override
   Widget build(BuildContext context) {
      var stack = Stack(
            children: [
            GestureDetector(
            onTap: () => {
            Navigator.of(context).pushNamed('/bookings')},
            child : Container(
            color: Colors.transparent,
            child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            color: Color(0xFF0080E2),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: new Center(
            child: new Text("DONE", 
            style: TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center) ))))]);
    return Scaffold(body: ListView(
       padding: EdgeInsets.all(10.0),
       children: [
        Padding(padding: EdgeInsets.only(top: 40),
        child: Image.asset('images/splash.jpeg', width: 100,height: 110)),
        Card(
          elevation: 5,
          color: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20),
              child: Text('ORDER ID - 121001',style: TextStyle(color: Color(0xFF7C7BDC),fontFamily: 'Roboto' , fontSize:  20)
              )),
              Padding(padding: EdgeInsets.only(top: 5),
              child: Text('We have made a perfect match for you',style: TextStyle(color: Color(0xFF000000),fontFamily: 'RobotoRegular' , fontSize:  12)
              )),
              Padding(padding: EdgeInsets.only(top: 15),
              child: Image.asset('images/profile.jpg',height: 100,width: 100)),
              Padding(padding: EdgeInsets.only(top: 0),
              child: Text('Muzmil Iqbal',style: TextStyle(color: Color(0xFF000000),fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
              Stack(
                children: [
                  Icon( Icons.star, color: Color(0xFFF8C744)),
                  Padding(padding: EdgeInsets.only(top: 3.5,left: 25),
                  child: Text('4.7/5',style: TextStyle(color: Color(0xFFF8C744),fontFamily: 'Roboto' ,
                  fontSize:  14)
              ))]),
              Divider(color: Color(0xFFF8C744)),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Icon( Icons.car_rental_outlined,
               color: Color(0xFFF8C744)),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('4.2 m truck 30 ton',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Type',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('Conatiner',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Pick-up Estimation',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('10 Hours Later',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Driving Year',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('10 years Above',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Register Number ',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('A99999999',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Brand',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('Volvo',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Model',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('XC90',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
              flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Estimated pick-up',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('2021/09/21',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.all(8),
              child: Row(
              children: <Widget>[
               Expanded(
               child: Container(child: Container(child: Text('Esimated Arrival',style: 
               TextStyle(color: Colors.grey,
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               alignment: Alignment.centerLeft),
               flex: 1),
               Expanded(
               child: Container(child: Text('2021/09/21',style: TextStyle(color: Color(0xFF000000),
               fontFamily: 'Roboto' ,
               fontSize:  14)
              )),
               flex: 1)
             ])),
              Padding(padding: EdgeInsets.only(top: 30,bottom: 30,right: 10,left: 10),
              child: stack)
            ]
          ),
        )
       ],
    ));

   
   }
}