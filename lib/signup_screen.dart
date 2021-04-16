
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       padding: EdgeInsets.all(10.0),
       children: <Widget> [
       Image.asset('images/splash.jpeg', width: 80,height: 110),
       Row(
        children: [
          Image.asset('images/profile.jpg', width: 60,height: 60),
          Text('Customer SignUp',style: TextStyle(fontFamily: 'Roboto', fontSize: 18.0),)
        ],
       ),
       Padding(padding: const EdgeInsets.only(top: 10.0),
       child: Text('Login/Create account quickly to manage orders'
       ,style: TextStyle(fontFamily: 'RobotoRegular', fontSize: 12.0,color: Color(0xFFC5C5C5)),)
       ),
       Padding(padding: const EdgeInsets.only(top: 20.0),
       child : Container(color: Color(0xFF878B95),width: 8.0,height: 30.0,
       alignment: Alignment.center,
       child :Text('Personal Info',
       style: TextStyle(fontFamily: 'RobotoRegular', 
        fontSize: 16.0,color: Color(0xFFFFFFFF)
       ,backgroundColor: Color(0xFF878B95))),
       )),
        Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 1,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'FirstName',
              border: OutlineInputBorder(),
            )
          )))),
          Expanded(
            flex: 1,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'LastName',
              border: OutlineInputBorder(),
            ),
          ),))
      )
        ],
       ),
       ),
        Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 60,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),))),
          Expanded(
            flex: 40,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Company Name',
              border: OutlineInputBorder(),
            ),
          ),))
      )
        ],
       ),
        ),
        Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 20,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: '+91',
              border: OutlineInputBorder(),
            ),
          ),))),
          Expanded(
            flex: 80,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              border: OutlineInputBorder(),
            ),
          ),))
      )
        ],
       ),
        ),
        Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 1,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),))),
          Expanded(
            flex: 1,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
             obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
          ),))
      )
     ],
    ),
     ),
     Padding(padding: const EdgeInsets.only(top: 20.0),
       child : Container(color: Color(0xFF878B95),width: 8.0,height: 30.0,
       alignment: Alignment.center,
       child :Text('Address Details',
       style: TextStyle(fontFamily: 'RobotoRegular', 
        fontSize: 16.0,color: Color(0xFFFFFFFF)
       ,backgroundColor: Color(0xFF878B95))),
       )),
       Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 1,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'House Number',
              border: OutlineInputBorder(),
            ),
          ),))),
          Expanded(
            flex: 1,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Street Name',
              border: OutlineInputBorder(),
            ),
          ),))
      )
     ],
    ),
     ),
      Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 1,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
            ),
          ),))),
          Expanded(
            flex: 1,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'State',
              border: OutlineInputBorder(),
            ),
          ),))
      )
     ],
    ),
     ),
      Padding(padding: const EdgeInsets.only(top: 10.0),
        child : Row(
        children: [
          Expanded(
            flex: 1,
            child :Padding(padding: const EdgeInsets.only(right: 2.0),
            child: Container(height: 40.0,
            child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Postcode',
              border: OutlineInputBorder(),
            ),
          ),))),
          Expanded(
            flex: 1,
             child :Padding(padding: const EdgeInsets.only(left: 2.0),
             child: Container(height: 40.0,
             child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontSize: 14.0 , fontFamily: 'RobotoRegular'),
            decoration: InputDecoration(
              labelText: 'Country',
              border: OutlineInputBorder(),
            ),
          ),))
      )
     ],
    ),
     ),
       Padding(padding: const EdgeInsets.only(top: 10.0),
       child: SizedBox(
          height: 50,
          child: TextButton(
            
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFF811F),
              primary: Color(0xFFFFFFFF),
              
            ),
            onPressed: () {
              print('Click on Login');
              Navigator.of(context).pushNamed('/Order');
            },
            child: Text('Sign Up'),
          ),
        ),
       )
     ],),
   );
 }
}