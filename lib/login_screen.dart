import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'datamodel/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                      ]))),
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
                      GestureDetector(
                          onTap: () {
                            showEnterPassword(context);
                          },
                          child: Text(
                            'Forgot password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff000000),
                                fontFamily: 'Roboto'),
                          )),
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(user["message"]),
          backgroundColor: Colors.green,
        ));
        Navigator.pushNamedAndRemoveUntil(context, "/navigation", (r) => false);
        // Navigator.of(context).pushNamed('/Order');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(user["message"]),
            backgroundColor: Colors.red));
      }
    });
  }
}

/* Widget horizontalList2 = new Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 200.0,
    child: Center(
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
    ]))); */

void showLoaderDialog(BuildContext context, bool value) {
  CustomProgressDialog progressDialog = CustomProgressDialog(context, blur: 10);

  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red)));
  progressDialog.show();
}

void showEnterPassword(BuildContext context) {
  String phone_number = "";
  NAlertDialog(
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Forgot Password?"),
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) => phone_number = value,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone',
              hintText: '1234567890'),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
          ])),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFF811F), primary: Color(0xFFFFFFFF)),
          onPressed: () {
            if (phone_number != null && phone_number.isNotEmpty) {
              sendOtpApi(context, phone_number);
            } else {
              Fluttertoast.showToast(
                  msg: "Please enter your valid mobile number",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Text('Send otp'),
        ),
      )
    ],
    blur: 2,
  ).show(context, transitionType: DialogTransitionType.BottomToTop);
}

void sendOtpApi(BuildContext context, String mobile) async {
  showLoaderDialog(context, false);
  var url = Uri.parse('https://routplaner.com/api/customerforgotpwdotpgen');
  await http.post(url,
      headers: {'Accept': 'application/json'},
      body: {"phone": mobile}).then((response) {
    print(response.body);
    Map<String, dynamic> user = jsonDecode(response.body);
    Navigator.pop(context);
    if (user["status"]) {
      Navigator.pop(context);
      EnterOtpDialog(context, user["otp"], user["customerId"]);
      Fluttertoast.showToast(
          msg: user["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: user["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  });
}

void EnterOtpDialog(BuildContext context, String otp, String customerId) {
  print("Enter Dialod customerId$customerId");
  String enter_otp = "";
  NAlertDialog(
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          "Otp successfully sent on your mobile number! please enter the valid otp here"),
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) => enter_otp = value,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Otp', hintText: '1234'),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
          ])),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFF811F), primary: Color(0xFFFFFFFF)),
          onPressed: () {
            if (enter_otp != null && enter_otp.isNotEmpty) {
              verifyOtpApi(context, enter_otp, customerId);
            } else {
              Fluttertoast.showToast(
                  msg: "Please enter valid otp here",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Text('Verify otp'),
        ),
      )
    ],
    blur: 2,
  ).show(context, transitionType: DialogTransitionType.BottomToTop);
}

void verifyOtpApi(BuildContext context, String otp, String customerId) async {
  showLoaderDialog(context, false);
  var url = Uri.parse('https://routplaner.com/api/customerforgotpwdotpverify');
  await http.post(url,
      headers: {'Accept': 'application/json'},
      body: {"otp": otp, "customerId": customerId}).then((response) {
    print(response.body);
    Map<String, dynamic> user = jsonDecode(response.body);
    Navigator.pop(context);
    if (user["status"]) {
      Navigator.pop(context);
      ResetPassworDialog(context,customerId);
      Fluttertoast.showToast(
          msg: user["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: user["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  });
}

void ResetPassworDialog(BuildContext context, String customerId) {
  print("Enter Dialod customerId$customerId");
  String newpassword = "";
  NAlertDialog(
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Enter new password"),
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: (value) => newpassword = value,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Password',
              hintText: '1234'),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
          ])),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFF811F), primary: Color(0xFFFFFFFF)),
          onPressed: () {
            if (newpassword != null && newpassword.isNotEmpty) {
              customerupdatepassword(context, newpassword, customerId);
            } else {
              Fluttertoast.showToast(
                  msg: "Enter passowrd here",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Text('Update Password'),
        ),
      )
    ],
    blur: 2,
  ).show(context, transitionType: DialogTransitionType.BottomToTop);
}

void customerupdatepassword(BuildContext context,  String password,String customerId) async {
  showLoaderDialog(context, false);
  var url = Uri.parse('https://routplaner.com/api/customerupdatepassword');
  await http.post(url, headers: {
    'Accept': 'application/json'
  }, body: {
    "new_password": password,
    "customerId": customerId
  }).then((response) {
    print(response.body);
    Map<String, dynamic> user = jsonDecode(response.body);
    Navigator.pop(context);
    if (user["status"]) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: user["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: user["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  });
}
