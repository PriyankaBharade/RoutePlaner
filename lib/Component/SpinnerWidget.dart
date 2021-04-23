
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:routeplan/datamodel/country_list.dart';
import 'package:http/http.dart' as http;


class SpinnerWidget extends StatefulWidget {
  const SpinnerWidget({Key ? Key}) : super(key: Key);
   @override
  _SpinnerWidgetState createState() => _SpinnerWidgetState();
}

class _SpinnerWidgetState extends State<SpinnerWidget> {
 late List<CountryElement> data = [];

 late Future<String> mfuture;
String selectedSpinnerItem = 'Select Country';

Future<String> fetchCountryList() async {
   var url = Uri.parse('https://routplaner.com/api/getcountries');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
    if (response.statusCode == 200) {
    print('Number of books about http: $data.');
    return "Load Successfully";
  } else {
    throw Exception('Failed to load data.');
  }
 }

  
   @override
  void initState() {
  //  mfuture = fetchCountryList();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
       // future: mfuture,
        builder: (context, snapshot) {
         // if (!snapshot.hasData)
         // return Center(child: CircularProgressIndicator());
          return spinnervalue(context);
          // return Scaffold(
          //   body: Center(
          //       child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //         DropdownButton(
          //           items: data.map((item) {
          //             return DropdownMenuItem(
          //               child: Text(item['country_name']),
          //               value: item['country_name'],
          //             );
          //           }).toList(),
          //           onChanged: (newVal) {
          //             setState(() {
          //               selectedSpinnerItem = newVal.toString();
          //             });
          //           },
          //           value: selectedSpinnerItem,
          //         ),
          //         Text(
          //           'Selected Item = ' + '$selectedSpinnerItem',
          //           style: TextStyle(fontSize: 22, color: Colors.black),
          //           textAlign: TextAlign.center,
          //         ),
          //       ])
          //       ),
          // );
        });
  }

  Widget spinnervalue(BuildContext context){
    String dropdownValue = 'One';
   return DropdownButton<String>(
      value: dropdownValue,
      style: const TextStyle(color: Colors.grey),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? newValue) {
        //  setState(() {
        //    dropdownValue = newValue!;
        //  });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
 }
}


