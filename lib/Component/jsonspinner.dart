import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class JsonSpinner extends StatefulWidget {
  JsonSpinnerWidget createState() => JsonSpinnerWidget();
}

class JsonSpinnerWidget extends State<JsonSpinner> {
  String selectedSpinnerItem = 'Eliseo@gardner.biz';
  List data = [];
  late Future myFuture;

  //final String uri = 'https://jsonplaceholder.typicode.com/comments?postId=1';
  final String uri = 'https://routplaner.com/api/getcountries';

  Future<String> fetchData() async {
    var response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      // var res = await http
      //     .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});

      var resBody = json.decode(response.body);
       List<dynamic> datavalue = resBody["countries"];
       print(datavalue);
      setState(() {
        data = datavalue;
      });

      print('Loaded Successfully');

      return "Loaded Successfully";
    } else {
      throw Exception('Failed to load data.');
    }
  }

  @override
  void initState() {
    myFuture = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        //future: myFuture,
        builder: (context, snapshot) {
         // if (!snapshot.hasData)
         // return Center(child: CircularProgressIndicator());
          return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  DropdownButton(
                    items: data.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['countrycode']),
                        value: item['countrycode'],
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        selectedSpinnerItem = newVal.toString();
                      });
                    },
                    value: selectedSpinnerItem,
                  ),
                  Text(
                    'Selected Item = ' + '$selectedSpinnerItem',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ])),
          );
        });
  }
}