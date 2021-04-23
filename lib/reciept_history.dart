import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class  RecieptHistory extends StatelessWidget{
   @override
   Widget build(BuildContext context) {
      var stack = Stack(
            children: [
            GestureDetector(
            onTap: () => {
            //Navigator.of(context).pushNamed('/RecieptHistory')
            },
            child : Container(
            color: Colors.transparent,
            child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
            color: Color(0xFF0080E2),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: new Center(
            child: new Text("Leave your feelings", 
            style: TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center) ))))]);
     return Scaffold(body: ListView(
       padding: EdgeInsets.all(10.0),
       children: [
           Padding(padding: EdgeInsets.only(top : 40),
           child: Image.asset('images/splash.jpeg', width: 100,height: 110)),
           Padding(padding: EdgeInsets.only(top: 20,left: 10),
           child: Text('Booking ID - 121001',style: TextStyle(color: Colors.grey,fontFamily: 'Roboto',fontSize:  12))),
           Card(
           elevation: 5,
           color: Color(0xFFFFFFFF),
           shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0)),
           child: Column(children: [
            Row(
                children: [
                  Image.asset('images/profile.jpg',height: 100,width: 100),
                  Padding(padding: EdgeInsets.only(top: 3.5,left: 0),
                  child : Column(children: [
                  Text('Driver',style: TextStyle(color: Colors.grey,
                  fontFamily: 'Roboto' ,
                  fontSize:  14)),
                  Text('Muzamil Iqbal',style: TextStyle(color: Colors.black,
                  fontFamily: 'Roboto' ,
                  fontSize:  16))
                  ])),
                  Padding(padding: EdgeInsets.only(top: 3.5,left: 10))]),
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
               child: Container(child: Text('Container',style: TextStyle(color: Color(0xFF000000),
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
             ]))
          ])),
           Card(
           color: Color(0xFFFFFFFF),
           shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.0)),
           child: Column(children: [
           Padding(padding: EdgeInsets.only(top: 20,left: 10),
           child: Text('Rate and Leave your feeling',style: TextStyle(color: Colors.black,
           fontFamily: 'Roboto',fontSize:  18))),
           RatingBar.builder(
           initialRating: 3,
           minRating: 1,
           direction: Axis.horizontal,
           allowHalfRating: true,
           itemCount: 5,
           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
           itemBuilder: (context, _) => Icon(
           Icons.star,
           color: Colors.amber),
           onRatingUpdate: (rating) {
           print(rating);}),
           Padding(padding: EdgeInsets.only(top: 20,left: 10,bottom: 20),
           child: TextField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Color(0xFF000000),
                  fontSize: 18,
                  fontFamily: 'RobotoRegular'),
                  decoration: InputDecoration(
                  labelText: 'Type your review',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8))))
           ])),
           Padding(padding: EdgeInsets.only(top: 30,bottom: 30,right: 10,left: 10),
              child: stack)
       ]
     ));
   }
}