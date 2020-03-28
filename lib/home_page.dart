import 'package:flutter/material.dart';
import 'login/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import "Prediction/PredictionScreen.dart";
import "Live/LiveScreen.dart";

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  @override
  _HomePage createState() => _HomePage(auth: auth,onSignOut: onSignOut);
}

class _HomePage extends State<HomePage>{
  _HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  var options = ["Live", "Prediction"];
  var checkpoints = ["Tuas", "WoodLand"];
  String live = "1";
  String predict = "2";
  String current_option = "Live";
  String current_checkpoint = "Tuas";

  @override
  Widget build(BuildContext context) {

    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }
    }

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amber,
          actions: <Widget>[
            new FlatButton(
                onPressed: _signOut,
                child: new Text('LOGOUT', style: new TextStyle(fontSize: 17.0, color: Colors.black))
            )
          ],
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              DropdownButton(

                items: options.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),

                  );
                }).toList(),
                onChanged: (String text){
                  //print(live_data);
                  setState(() {
                    current_option = text;
                  });
                },
                focusColor: Color.fromRGBO(0, 0, 255, 1),
                iconDisabledColor: Color.fromRGBO(0, 0, 0, 1),
                value: current_option,
              ),
              DropdownButton(

                items: checkpoints.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),

                  );
                }).toList(),
                onChanged: (String text){
                  setState(() {
                    current_checkpoint = text;
                  });
                },
                focusColor: Color.fromRGBO(0, 0, 255, 1),
                iconDisabledColor: Color.fromRGBO(0, 0, 0, 1),
                value: current_checkpoint,
              ),
              FlatButton(
                onPressed: (){
                  //test.getData();
                  callRoutine(context, current_option, current_checkpoint);
                },
                child: Text("Start"),
              )
            ],
          ),
        ),
    );
  }
  void callRoutine(BuildContext context, String routineName, String text){
    if (routineName == "Live"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LiveScreen(checkpoint: text) ));
    }
    if (routineName == "Prediction"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionScreen()));
    }

  }

}