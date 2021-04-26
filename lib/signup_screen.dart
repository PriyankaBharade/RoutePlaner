import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ndialog/ndialog.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //String dropdownValue = 'id';
  // // String countryCode = "";
  var countryCodeValue = "+91";
  var countrynamevalue;
  var statevalue;
  var cityvalue;
  List<dynamic> data = [0];
  List<dynamic> city = [0];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late List<dynamic> statelist = [
    {"statecode": "oo", "statename": "Select State"}
  ];
  String firstname = "",
      lastname = "",
      email = "",
      countryCode = "",
      companyname = "",
      mobilenumber = "",
      password = "",
      confirmpassword = "",
      housenumber = "",
      streetname = "",
      cityname = "",
      state = "",
      countryname = "",
      postalcode = "";

  // [{statecode: DE, statename: DELHI}, {statecode: HR, statename: HARYANA}, {statecode: UP, statename: UTTAR PRADESH}]
  @override
  void initState() {
    //main();
    super.initState();
    // getCountryListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            autovalidate: true, //check for validation while typing
            key: formkey,
            child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
              Image.asset('images/splash.jpeg', width: 80, height: 110),
              Row(
                children: [
                  Image.asset('images/profile.jpg', width: 60, height: 60),
                  Text(
                    'Customer SignUp',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 18.0),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Login/Create account quickly to manage orders',
                    style: TextStyle(
                        fontFamily: 'RobotoRegular',
                        fontSize: 12.0,
                        color: Color(0xFFC5C5C5)),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    color: Color(0xFF878B95),
                    width: 8.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    child: Text('Personal Info',
                        style: TextStyle(
                            fontFamily: 'RobotoRegular',
                            fontSize: 16.0,
                            color: Color(0xFFFFFFFF),
                            backgroundColor: Color(0xFF878B95))),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) => firstname = value,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'RobotoRegular'),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'FirstName'),
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: "* Required")
                                    ]))))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) => lastname = value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'LastName',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required")
                                  ])),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 60,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                              child: TextFormField(
                                  onChanged: (value) => email = value,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                    EmailValidator(
                                        errorText: "Enter valid email id"),
                                  ])),
                            ))),
                    Expanded(
                        flex: 40,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) => companyname = value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'Company Name',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                  ])),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 20,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                              child: TextFormField(
                                  showCursor: false,
                                  enabled: false,
                                  controller: TextEditingController(
                                      text: '$countryCodeValue'),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => countryCode = value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: '+91',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                  ])),
                            ))),
                    Expanded(
                        flex: 80,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              child: TextFormField(
                                  maxLength: 10,
                                  onChanged: (value) => mobilenumber = value,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'Mobile Number',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                  ])),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                              child: TextFormField(
                                  onChanged: (value) => password = value,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                    MinLengthValidator(6,
                                        errorText:
                                            "Password should be atleast 6 characters"),
                                    MaxLengthValidator(15,
                                        errorText:
                                            "Password should not be greater than 15 characters")
                                  ])),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              child: TextFormField(
                                  obscureText: true,
                                  onChanged: (value) => confirmpassword = value,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                    MinLengthValidator(6,
                                        errorText:
                                            "Password should be atleast 6 characters"),
                                    MaxLengthValidator(15,
                                        errorText:
                                            "Password should not be greater than 15 characters")
                                  ])),
                            )))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    color: Color(0xFF878B95),
                    width: 8.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    child: Text('Address Details',
                        style: TextStyle(
                            fontFamily: 'RobotoRegular',
                            fontSize: 16.0,
                            color: Color(0xFFFFFFFF),
                            backgroundColor: Color(0xFF878B95))),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                              child: TextFormField(
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => housenumber = value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'House Number',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                  ])),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) => streetname = value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'Street Name',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                  ])),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<List<dynamic>>(
                        builder: (context, projectSnap) {
                          if (projectSnap.connectionState ==
                                  ConnectionState.none &&
                              projectSnap.hasData == null) {
                            return Container();
                          }
                          List<dynamic> list = projectSnap.data!;
                          return Container(
                              child: GestureDetector(
                                  onTap: () {
                                    //print("Call Country List");
                                    showListDialog(context, list);
                                  },
                                  child: TextFormField(
                                      controller: TextEditingController(
                                          text: countrynamevalue),
                                      showCursor: false,
                                      enabled: false,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) => postalcode = value,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'RobotoRegular'),
                                      decoration: InputDecoration(
                                        labelText: "Select Country",
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "* Required"),
                                      ]))));
                          //return spinnervalue(context, list);
                          //  return showListDialog(context,list);
                        },
                        future: getCountryListApi(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: GestureDetector(
                              onTap: () {
                                showStateListDialog(context, statelist);
                                //print("Call Country List");
                                /* if (countrynamevalue != null) {
                                   showStateListDialog(context, statelist);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Please Select Country")));
                                  } */
                              },
                              child: TextFormField(
                                  controller:
                                      TextEditingController(text: statevalue),
                                  showCursor: false,
                                  enabled: false,
                                  keyboardType: TextInputType.name,
                                  //  onChanged: (value) => cityname = value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoRegular'),
                                  decoration: InputDecoration(
                                    labelText: 'State',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                  ])))
                          // child: spinnerStatevalue(context, statelist)
                          ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => postalcode = value,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'RobotoRegular'),
                                    decoration: InputDecoration(
                                      labelText: 'Postcode',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "* Required"),
                                    ]))))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  showCityListDialog(context, city);
                                  /* if (statevalue != null) {
                                    showCityListDialog(context, city);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Please Select State")));
                                  } */
                                },
                                child: TextFormField(
                                    controller:
                                        TextEditingController(text: cityvalue),
                                    showCursor: false,
                                    enabled: false,
                                    keyboardType: TextInputType.name,
                                    // onChanged: (value) => cityname = value,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'RobotoRegular'),
                                    decoration: InputDecoration(
                                      labelText: 'City',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "* Required"),
                                    ])),
                              ),
                            )))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                      height: 50,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFF811F),
                            primary: Color(0xFFFFFFFF),
                          ),
                          onPressed: () {
                            print('Click on Login');
                            if (formkey.currentState!.validate()) {
                              showLoaderDialog(context);
                              signUpAPI(
                                  context,
                                  firstname,
                                  lastname,
                                  confirmpassword,
                                  mobilenumber,
                                  housenumber,
                                  streetname,
                                  cityname,
                                  state,
                                  postalcode,
                                  countryname,
                                  email,
                                  password);
                            }
                            //main();
                          },
                          child: Text('Sign Up'))))
            ])));
  }

  Future<List<dynamic>> getCountryListApi() async {
    var url = Uri.parse('https://routplaner.com/api/getcountries');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final Map parsed = json.decode(response.body);
    List<dynamic> datavalue = parsed["countries"];
    print("API Call Data $datavalue");
    print(datavalue[0]);
    //  setState(() {
    data = datavalue;
    // });
    return Future.value(datavalue);
    //print('Data $data');
  }

  Future<List<dynamic>> getStateList(String countryCodeValue) async {
    var url = Uri.parse('https://routplaner.com/api/getstatesofacountry');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        headers: {'Accept': 'application/json'},
        body: {"countrycode": countryCodeValue});
    final Map parsed = json.decode(response.body);
    print(response.body);
    List<dynamic> datavalue = parsed["statedetails"];
    setState(() {
      statevalue = datavalue[0]['statename'];
      state = datavalue[0]['statecode'];
      statelist = (datavalue);
    });
    getCityList(state);
    // print(statelist.toString());
    return Future.value(datavalue);
  }

  Future<List<dynamic>> getCityList(String statecode) async {
    var url = Uri.parse('https://routplaner.com/api/getcitiesofastate');
    var response = await http.post(url,
        headers: {'Accept': 'application/json'},
        body: {"statecode": statecode});
    final Map parsed = json.decode(response.body);
    print(response.body);
    List<dynamic> datavalue = parsed["citydetails"];
    setState(() {
      cityvalue = datavalue[0]['cityname'];
      cityname = datavalue[0]['citycode'];
      city = (datavalue);
    });
    getStateList(cityname);
    // print(statelist.toString());
    return Future.value(datavalue);
  }

  void showStateListDialog(BuildContext context, List<dynamic> dataCountry) {
    Dialog(
        child: ListView.builder(
      itemCount: dataCountry.length,
      itemBuilder: (BuildContext context, index) {
        Map<String, dynamic> map = dataCountry[index];
        return Column(children: [
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(map['statename']),
              ),
              onTap: () {
                Navigator.pop(context, map);
                setState(() {
                  statevalue = map['statename'];
                  state = map['statecode'];
                });
                getCityList(map['statecode']);
              })
        ]);
      },
    )).show(context);
    /* AlertDialog alert = AlertDialog(
      content: ListView.builder(
        itemCount: dataCountry.length,
        itemBuilder: (BuildContext context, index) {
          Map<String, dynamic> map = dataCountry[index];
          return Column(children: [
            GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(map['statename']),
                ),
                onTap: () {
                  Navigator.pop(context, map);
                  getCityList(map['statecode']);
                })
          ]);
        },
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) {
      setState(() {
        statevalue = value['statename'];
        state = value['statecode'];
      });
    }); */
  }

  void showCityListDialog(BuildContext context, List<dynamic> dataCity) {
    Dialog(
        child: ListView.builder(
      itemCount: dataCity.length,
      itemBuilder: (BuildContext context, index) {
        Map<String, dynamic> map = dataCity[index];
        return Column(children: [
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(map['cityname']),
              ),
              onTap: () {
                Navigator.pop(context, map);
                setState(() {
                  cityvalue = map['cityname'];
                  cityname = map['citycode'];
                });
              })
        ]);
      },
    )).show(context);
    /*  AlertDialog alert = AlertDialog(
      content: ListView.builder(
        itemCount: dataCity.length,
        itemBuilder: (BuildContext context, index) {
          Map<String, dynamic> map = dataCity[index];
          return Column(children: [
            GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(map['cityname']),
                ),
                onTap: () {
                  Navigator.pop(context, map);
                })
          ]);
        },
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) {
      setState(() {
        cityvalue = value['cityname'];
        cityname = value['citycode'];
      });
    }); */
  }

  void showListDialog(BuildContext context, List<dynamic> dataCountry) {
    Dialog(
      child: ListView.builder(
        itemCount: dataCountry.length,
        itemBuilder: (BuildContext context, index) {
          Map<String, dynamic> map = dataCountry[index];
          return Column(children: [
            GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(map['country_name']),
                ),
                onTap: () {
                  Navigator.pop(context, map);
                  setState(() {
                    countryCodeValue = map['dialingcode'];
                    countrynamevalue = map['country_name'];
                    countryCode = countryCodeValue;
                    countryname = countrynamevalue;
                  });
                  getStateList(map['countrycode']);
                })
          ]);
        },
      ),
    ).show(context);
  }
}

void signUpAPI(
    BuildContext context,
    String firstname,
    String lastname,
    String confirmpassword,
    String phone,
    String houseno,
    String street,
    String city,
    String state,
    String postcode,
    String country,
    String email,
    String pass) async {
  var url = Uri.parse('https://routplaner.com/api/customersignup');
  await http.post(url, headers: {
    'Accept': 'application/json'
  }, body: {
    "email": email,
    "first_name": firstname,
    "last_name": lastname,
    "confirm_password": confirmpassword,
    "phone": phone,
    "house_no": houseno,
    "street": street,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": country,
    "password": pass
  }).then((response) {
    print(response.body);
    Map<String, dynamic> user = jsonDecode(response.body);
    Navigator.pop(context);
    if (user["status"]) {
    //  Navigator.of(context).pushNamedAndRemoveUntil(context,'/login',(r) => false);
      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(user["message"]),backgroundColor: Colors.greenAccent));
      //  LoginModel loginModel = LoginModel.fromJson(user);
      // print(loginModel.email);
      // Navigator.of(context).pushNamed('/SignUp');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(user["message"])));
    }
  });
}

void showLoaderDialog(BuildContext context) {
  CustomProgressDialog progressDialog = CustomProgressDialog(context, blur: 10);

  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red)));
  progressDialog.show();
  /*  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  ); */

  /*  showDialog(
    context: context,
    builder: (context) => CustomDialog(
      content: Text(
        'No Access',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20.0,
        ),
      ),
      title: Text('Error'),
      firstColor: Colors.red,
      secondColor: Colors.white,
      headerIcon: Icon(
        Icons.error_outline,
        size: 120.0,
        color: Colors.white,
      ),
    ),
  ); */
}
