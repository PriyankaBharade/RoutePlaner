import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Ongoing() {
  return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, index) {
            return Card(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(top: 7, left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Booking Id 1234567899',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.download),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('images/newimage.jpg',
                            width: 40, height: 40),
                        Container(
                          width: 10,
                        ),
                        Text('42 min remaining')
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _Details('Details'),
                          _Details('Order Modification')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          })
          );
}

Widget _Details(title) {
  return RaisedButton(
    textColor: Colors.white,
    splashColor: Colors.blue,
    color: Colors.blue,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
    child: Text(title),
    onPressed: () {},
  );
}
