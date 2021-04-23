import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {

CircularProgressWidget createState() => CircularProgressWidget();

}

class CircularProgressWidget extends State {

  bool visible = true ;

  loadProgress(){

    if(visible == true){
      setState(() {
        visible = false;
      });
    }
    else{
      setState(() {
        visible = true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      child: CircularProgressIndicator()
                  )
              ),

              RaisedButton(
                onPressed: loadProgress,
                color: Colors.lightGreen,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text('Show Hide Circular Progress'),
              ),

            ],
          ),
        ));
  }
}