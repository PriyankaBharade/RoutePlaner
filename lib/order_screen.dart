import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
/* import 'package:date_time_picker/date_time_picker.dart';
 */
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
/* import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart'; */

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreen createState() => _OrderScreen();
}

class _OrderScreen extends State<OrderScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // var sourceaddressname = "Pick up Address";
  //var destinationaddressname ="Destination Address";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool selection = false;
  var stextController = new TextEditingController();
  var dtextController = new TextEditingController();
  TextEditingController datecontroller = new TextEditingController();
  TextEditingController timecontroller = new TextEditingController();
  String firstname = "",
      vehicletype = "",
      customerId = "",
      accessToken = "",
      companyname = "",
      lastname = "",
      mobilenumber = "",
      pickuplocation = "",
      pickuplatitude = "",
      pickuplongitude = "",
      itemdescription = "",
      itemquantity = "",
      deliverydate = "",
      deliverytime = "",
      specialinstructions = "",
      dropoffcompanyname = "",
      dropofffirstname = "",
      dropofflastname = "",
      dropofflocation = "",
      dropofflongitude = "",
      dropofflatitude = "",
      parcelheight = "",
      parcelwidth = "",
      parcellength = "",
      parcelweight = "";

  /* void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  } */

  @override
  Widget build(BuildContext context) {
    var stack = Stack(children: [
      Padding(
          padding: EdgeInsets.only(top: 5),
          child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('images/splash.jpeg', width: 30, height: 30))),
      Padding(
        padding: EdgeInsets.only(right: 30),
        child: GestureDetector(
            onTap: () => {
                  if (formkey.currentState!.validate())
                    {showLoaderDialog(context, false), booking(context)}
                },
            child: Container(
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFF0080E2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text("Order now",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center),
                  )),
            )),
      )
    ]);
    return Scaffold(
        body: Form(
            autovalidate: true, //check for validation while typing
            key: formkey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                Stack(alignment: Alignment.centerLeft, children: [
                  Text('Book',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          color: Color(0xFF000000))),
                  Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Center(
                        child: Image.asset('images/splash.jpeg',
                            width: 100, height: 110),
                      ))
                ]),
                Card(
                  elevation: 5,
                  color: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 4,
                                  child: Text('Recipient Name',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              //  child : Padding(padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) => companyname = value,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 12,
                                          fontFamily: 'RobotoRegular'),
                                      decoration: InputDecoration(
                                          labelText: 'Company name',
                                          isDense: true, // Added this
                                          contentPadding: EdgeInsets.all(8)),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "* Required")
                                      ])))
                              // )
                              )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 4,
                                  child: Text('Item Description',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              //  child : Padding(padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) =>
                                          itemdescription = value,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 12,
                                          fontFamily: 'RobotoRegular'),
                                      decoration: InputDecoration(
                                          labelText: 'Item Description',
                                          isDense: true, // Added this
                                          contentPadding: EdgeInsets.all(8)),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "* Required")
                                      ])))
                              // )
                              )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 4,
                                  child: Text('Quantity',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              //  child : Padding(padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) =>
                                          itemquantity = value,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 12,
                                          fontFamily: 'RobotoRegular'),
                                      decoration: InputDecoration(
                                          labelText: 'quantity',
                                          isDense: true, // Added this
                                          contentPadding: EdgeInsets.all(8)),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "* Required")
                                      ])))
                              // )
                              )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 5,
                                  child: Text('Contact',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) =>
                                              mobilenumber = value,
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontFamily: 'RobotoRegular'),
                                          decoration: InputDecoration(
                                              labelText: 'contact number',
                                              isDense: true, // Added this
                                              contentPadding:
                                                  EdgeInsets.all(8)),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "* Required")
                                          ])))))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Card(
                        elevation: 5,
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Text('Your Address',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF000000))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset('images/splash.jpeg',
                                            width: 20, height: 20))
                                  ])),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Image.asset('images/splash.jpeg',
                                          width: 18, height: 18)),
                                  Expanded(
                                      flex: 9,
                                      child: GestureDetector(
                                          onTap: () {
                                            selection = true;
                                            showPlacePicker(context);
                                          },
                                          child: TextFormField(
                                              controller: stextController,
                                              showCursor: false,
                                              enabled: false,
                                              keyboardType:
                                                  TextInputType.number,
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily: 'RobotoRegular',
                                                  fontSize: 12),
                                              decoration: InputDecoration(
                                                  labelText:
                                                      'Departure from here departure address',
                                                  isDense: true, // Added this
                                                  contentPadding:
                                                      EdgeInsets.all(8)),
                                              validator: MultiValidator([
                                                RequiredValidator(
                                                    errorText: "* Required")
                                              ]))))
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.asset('images/splash.jpeg',
                                        width: 18, height: 18)),
                                Expanded(
                                  flex: 9,
                                  child: GestureDetector(
                                    onTap: () {
                                      selection = false;
                                      showPlacePicker(context);
                                    },
                                    child: TextFormField(
                                        controller: dtextController,
                                        showCursor: false,
                                        enabled: false,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontFamily: 'RobotoRegular',
                                            fontSize: 12),
                                        decoration: InputDecoration(
                                            labelText:
                                                'Destination from here departure address',
                                            isDense: true, // Added this
                                            contentPadding: EdgeInsets.all(8)),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required")
                                        ])),
                                  ),
                                )
                              ])),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('*Fill your notes and requires',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF4083BA))),
                          )
                        ]))),
                Card(
                    elevation: 5,
                    color: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(children: <Widget>[
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 4,
                                  child: Text('Parcel height in meter',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              //  child : Padding(padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                      onChanged: (value) =>
                                          parcelheight = value,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 12,
                                          fontFamily: 'RobotoRegular'),
                                      decoration: InputDecoration(
                                          labelText: 'Parcel Height',
                                          isDense: true, // Added this
                                          contentPadding: EdgeInsets.all(8)),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "* Required")
                                      ])))
                              // )
                              )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 5,
                                  child: Text('Parcel Width in meter',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                          onChanged: (value) =>
                                              parcelwidth = value,
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontFamily: 'RobotoRegular'),
                                          decoration: InputDecoration(
                                            labelText: 'Parcel width in meter',
                                            isDense: true, // Added this
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "* Required")
                                          ])))))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 5,
                                  child: Text('Parcel Length in meter',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                          onChanged: (value) =>
                                              parcellength = value,
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontFamily: 'RobotoRegular'),
                                          decoration: InputDecoration(
                                            labelText: 'Parcel length in meter',
                                            isDense: true, // Added this
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "* Required")
                                          ])))))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 5,
                                  child: Text('Parcel Weight in Kg',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                          onChanged: (value) =>
                                              parcelweight = value,
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontFamily: 'RobotoRegular'),
                                          decoration: InputDecoration(
                                            labelText: 'Parcel weight in Kg',
                                            isDense: true, // Added this
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "* Required")
                                          ])))))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 5,
                                  child: Text('Select Date',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: GestureDetector(
                                      onTap: () {
                                        datePicker(context);
                                      },
                                      child: Expanded(
                                          flex: 5,
                                          child: TextFormField(
                                              controller: datecontroller,
                                              enabled: false,
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: 12,
                                                  fontFamily: 'RobotoRegular'),
                                              decoration: InputDecoration(
                                                labelText: 'Select Date',
                                                isDense: true, // Added this
                                                contentPadding:
                                                    EdgeInsets.all(8),
                                              ),
                                              validator: MultiValidator([
                                                RequiredValidator(
                                                    errorText: "* Required")
                                              ]))))))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Expanded(
                                  flex: 5,
                                  child: Text('Select Time',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'RobotoRegular')))),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: GestureDetector(
                                      onTap: () {
                                        timePicker(context);
                                      },
                                      child: Expanded(
                                          flex: 5,
                                          child: TextFormField(
                                              controller: timecontroller,
                                              enabled: false,
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: 12,
                                                  fontFamily: 'RobotoRegular'),
                                              decoration: InputDecoration(
                                                labelText: 'Select Time',
                                                isDense: true, // Added this
                                                contentPadding:
                                                    EdgeInsets.all(8),
                                              ),
                                              validator: MultiValidator([
                                                RequiredValidator(
                                                    errorText: "* Required")
                                              ]))))))
                        ],
                      )
                    ])),
                Card(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Set Your DropOff Information',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Color(0xFF4083BA))),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Expanded(
                                flex: 4,
                                child: Text('Dropoff Company name',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'RobotoRegular')))),
                        Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        onChanged: (value) =>
                                            dropoffcompanyname = value,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 12,
                                            fontFamily: 'RobotoRegular'),
                                        decoration: InputDecoration(
                                            labelText: 'Dropoff Company name',
                                            isDense: true, // Added this
                                            contentPadding: EdgeInsets.all(8)),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required")
                                        ])))))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Expanded(
                                flex: 4,
                                child: Text('Dropoff First Name',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'RobotoRegular')))),
                        Flexible(
                            //  child : Padding(padding: EdgeInsets.all(8),
                            child: Expanded(
                                flex: 6,
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) =>
                                        dropofffirstname = value,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 12,
                                        fontFamily: 'RobotoRegular'),
                                    decoration: InputDecoration(
                                        labelText: 'Dropoff First name',
                                        isDense: true, // Added this
                                        contentPadding: EdgeInsets.all(8)),
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: "* Required")
                                    ])))
                            // )
                            )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Expanded(
                                flex: 4,
                                child: Text('Dropoff Last Name',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'RobotoRegular')))),
                        Flexible(
                            //  child : Padding(padding: EdgeInsets.all(8),
                            child: Expanded(
                                flex: 6,
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) =>
                                        dropofflastname = value,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 12,
                                        fontFamily: 'RobotoRegular'),
                                    decoration: InputDecoration(
                                        labelText: 'Dropoff Last name',
                                        isDense: true, // Added this
                                        contentPadding: EdgeInsets.all(8)),
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: "* Required")
                                    ])))
                            // )
                            )
                      ],
                    )
                  ],
                )),
                Padding(padding: EdgeInsets.only(top: 10), child: stack),
              ]),
            )));
  }

  void showPlacePicker(BuildContext context) async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
            "AIzaSyBmyylag7PGe6zPf_So8hGDx6oKiTopYgg"))); //AIzaSyDmlkf91z1CnaYf2XU6gs2nmIjLXXS9O08
    //AIzaSyCzpKyJbXiTaAA2b3vx5rEZQEKczCwjcVo
    print(selection);
    if (selection) {
      stextController.text = result.formattedAddress.toString();
      pickuplocation = result.formattedAddress.toString();
      pickuplatitude = result.latLng!.latitude as String;
      pickuplongitude = result.latLng!.longitude as String;
      /*  setState(() {
        sourceaddressname = result.formattedAddress.toString();
      }); */
    } else {
      dtextController.text = result.formattedAddress.toString();
      dropofflocation = result.formattedAddress.toString();
      dropofflatitude = result.latLng!.latitude as String;
      dropofflongitude = result.latLng!.longitude as String;
      /*  setState(() {
        destinationaddressname = result.formattedAddress.toString();
      }); */
    }
  }

  void booking(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    Map<String, dynamic> user =
        jsonDecode(prefs.getString("user_data").toString());
    var url = Uri.parse('https://routplaner.com/api/createpacketorder');
    await http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      "vehicle_type": vehicletype,
      "customerId": user["customerId"],
      "accessToken": user["accessToken"],
      "company_name": companyname,
      "first_name": user["customer_name"],
      "last_name": user["customer_name"],
      "mobile_number": mobilenumber,
      "pickup_location": pickuplocation,
      "pickup_latitude": pickuplatitude,
      "pickup_longitude": pickuplongitude,
      "item_description": itemdescription,
      "item_quantity": itemquantity,
      "delivery_time": deliverytime,
      "special_instructions": specialinstructions,
      "dropoff_company_name": dropoffcompanyname,
      "dropoff_first_name": dropofffirstname,
      "dropoff_last_name": dropofflastname,
      "dropoff_location": dropofflocation,
      "dropoff_longitude": dropofflongitude,
      "dropoff_latitude": dropofflatitude,
      "parcel_height": parcelheight,
      "parcel_width": parcelwidth,
      "parcel_length": parcellength,
      "parcel_weight": parcelweight,
    }).then((response) {
      print(response.body);
      Navigator.pop(context);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["status"]) {
        //  prefs.setString("order_id", data["orderId"]);
        Navigator.of(context).pushNamed('/OrderReciept');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data["message"]),
            backgroundColor: Colors.greenAccent));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));
      }
    });
  }

  Future<Null> _handleDatePicker(BuildContext floatContext) async {
    final dateResult = await showDatePicker(
        context: floatContext,
        firstDate: DateTime.now(),
        initialDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime.now().add(Duration(days: 60)));
    //datePicker(floatContext);
    //prints the chosen date from the picker
    print(dateResult);
  }

  void datePicker(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 1, 1),
        maxTime: DateTime(2100, 12, 12),
        onChanged: (date) {}, onConfirm: (date) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(date);
      datecontroller.text = formatted;
      deliverydate = formatted;
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void timePicker(BuildContext context) {
    DatePicker.showTime12hPicker(context, showTitleActions: true,
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      final DateFormat formatter = DateFormat('HH:mm');
      final String formatted = formatter.format(date);
      timecontroller.text = formatted;
      deliverytime = formatted;
    }, currentTime: DateTime.now());
  }
}

void showLoaderDialog(BuildContext context, bool value) {
  CustomProgressDialog progressDialog = CustomProgressDialog(context, blur: 10);

  ///You can set Loading Widget using this function
  progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red)));
  progressDialog.show();
}
