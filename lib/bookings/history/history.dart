import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Image img = Image.asset('images/newimage.jpg', width: 40, height: 40);
Widget History(context) {
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
                      ],
                    ),
                    Row(
                      children: [
                        img,
                        Container(
                          width: 10,
                        ),
                        Text('42 min remaining')
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _Details('Invoice', Colors.blue, context),
                          _Details('Details', Colors.green, context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }));
}

Widget _Details(title, buttonColor, context) {
  return RaisedButton(
    textColor: Colors.white,
    splashColor: buttonColor,
    color: buttonColor,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
    child: Text(title),
    onPressed: () {
      _showSimpleModalDialog(context);
    },
  );
}

Widget _order_id_button(BuildContext context) {
  return RaisedButton(
    textColor: Colors.blue,
    splashColor: Colors.white,
    color: Colors.white,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10.0),
    ),
    child: Text('Order ID - 123456789'),
    onPressed: () {
       Navigator.of(context).pushNamed('/RecieptHistory');
    },
  );
}

_showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                // begin: Alignment.topLeft,
                //   end: Alignment(0.8, 0.0),
                colors: <Color>[Color(0xFF439ED3), Color(0xFF6CCF8C)],
                tileMode: TileMode.mirror,
              ),
            ),
            constraints: BoxConstraints(maxHeight: 280),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: _order_id_button(context),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: img,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: _Details(
                                'Let me think a bit', Colors.blue, context),
                          ),
                          _Details('Cancel Order', Colors.grey, context)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
