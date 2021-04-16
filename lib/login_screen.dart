import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Image.asset('images/splash.jpeg', width: 200),
        SizedBox(
           width: 100,height: 100,
          child: Image.asset(
            'images/profile.jpg',
           
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Customer',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Color(0xff000000), fontFamily: 'Roboto'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Login',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20, color: Color(0xff000000), fontFamily: 'Roboto'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            'Enter your phone number to proceed',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff000000),
                fontFamily: 'RobotoRegular'),
          ),
        ),
        Padding(
         padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextButton(
            
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFF811F),
              primary: Color(0xFFFFFFFF),
              
            ),
            onPressed: () {
              print('Click on Login');
              Navigator.of(context).pushNamed('/SignUp');
            },
            child: Text('Login'),
          ),
        ),
   Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
       Text(
            'Do not have an account?',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff000000),
                fontFamily: 'Roboto'),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/SignUp');
            },
             child : Text(
            'Sign Up Here?',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff36B889),
                fontFamily: 'Roboto'),
          )
          ),
          
          Text(
            'Forgot password?',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff000000),
                fontFamily: 'Roboto'),
          ),
      ],
    )
    ),
       // horizontalList2
      ],
    ));
  }
}

Widget horizontalList2 = new Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
       Text(
            'Do not have an account?',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff000000),
                fontFamily: 'Roboto'),
          ),
          GestureDetector(
            onTap: (){
             // Navigator.of().pushNamed('/login');
            },
             child : Text(
            'Sign Up Here?',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff36B889),
                fontFamily: 'Roboto'),
          )
          ),
          
          Text(
            'Forgot password?',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff000000),
                fontFamily: 'Roboto'),
          ),
      ],
    )
    );
