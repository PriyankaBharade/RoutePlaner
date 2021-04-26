import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'datamodel/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool visible = false;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // body: SingleChildScrollView(
      body: Form(
          autovalidate: true, //check for validation while typing
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              Image.asset('images/splash.jpeg', width: 200),
              SizedBox(
                width: 100,
                height: 100,
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
                      fontSize: 16,
                      color: Color(0xff000000),
                      fontFamily: 'Roboto'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontFamily: 'Roboto'),
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
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'abc@gmail.com'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ]))),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Secure password'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        MinLengthValidator(6,
                            errorText:
                                "Password should be atleast 6 characters"),
                        MaxLengthValidator(15,
                            errorText:
                                "Password should not be greater than 15 characters")
                      ])
                      )),
              SizedBox(
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFFF811F),
                      primary: Color(0xFFFFFFFF)),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print('Click on Login $email + "pass" $password');
                      showLoaderDialog(context, true);
                      loginApi(context, email, password);
                    }
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
                          onTap: () {
                            Navigator.of(context).pushNamed('/SignUp');
                          },
                          child: Text(
                            'Sign Up Here?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff36B889),
                                fontFamily: 'Roboto'),
                          )),
                      Text(
                        'Forgot password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff000000),
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  )),
              // horizontalList2
            ],
          )),
      // )
    );
  }

  void loginApi(BuildContext context, String email, String pass) async {
    var url = Uri.parse('https://routplaner.com/api/customerlogin');
    final SharedPreferences prefs = await _prefs;
    await http.post(url,
        headers: {'Accept': 'application/json'},
        body: {"email": email, "password": pass}).then((response) {
      print(response.body);
      Map<String, dynamic> user = jsonDecode(response.body);
       Navigator.pop(context);
      if (user["status"]) {
        prefs.setString("user_data", response.body);
        LoginModel loginModel = LoginModel.fromJson(user);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(user["message"]),backgroundColor: Colors.greenAccent,));
            Navigator.pushNamedAndRemoveUntil(context, "/Order", (r) => false);
       // Navigator.of(context).pushNamed('/Order');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(user["message"])));
      }
    });
  }
}

Widget horizontalList2 = new Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 200.0,
    child : Center(
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
      Padding(
          padding: EdgeInsets.all(100),
          child: Text(
            'Do not have an account?',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12, color: Color(0xff000000), fontFamily: 'Roboto'),
          )),
      Padding(
          padding: EdgeInsets.all(100),
          child: GestureDetector(
              onTap: () {
                // Navigator.of().pushNamed('/login');
              },
              child: Text(
                'Sign Up Here?',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff36B889),
                    fontFamily: 'Roboto'),
              ))),
      Padding(
          padding: EdgeInsets.all(100),
          child: Text('Forgot password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff000000),
                  fontFamily: 'Roboto')))
    ]
    ))
    
    );

void showLoaderDialog(BuildContext context, bool value) {
  CustomProgressDialog progressDialog = CustomProgressDialog(context, blur: 10);

  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red)));
  progressDialog.show();
}

/* showPicker(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPicker(
          backgroundColor: Colors.white,
          onSelectedItemChanged: (value) {
            print(value);
            // setState(() {
            //   selectedValue = value;
            // });
          },
          itemExtent: 32.0,
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return Column(
                 children: [
                   Text("Country")
                 ],);
              },
            )
          ],
          /*  children: const [
              Text('Item01'),
              Text('Item02'),
              Text('Item03'),
            ], */
        );
      });
} */
