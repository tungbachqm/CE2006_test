// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutterapp/GraphDataList.dart';
import "GraphData.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "server/AccessDatabase.dart";
void main() => runApp(MaterialApp(
  home: TestApp(),
));


class TestApp extends StatefulWidget{
  @override
  _TestApp createState() => _TestApp();
}
class _TestApp extends State<TestApp> {
  // variable
  var options = ["Live", "Prediction"];
  var checkpoints = ["Tuas", "WoodLand"];
  String live = "1";
  String predict = "2";
  String current_option = "Live";
  String current_checkpoint = "Tuas";
  AccessDataBase test = new AccessDataBase();

  final CollectionReference live_data = Firestore.instance.collection("livetraffic1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
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
                  test.getData();
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => second_routine(checkpoint: text) ));
    }
    if (routineName == "Prediction"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionScreen()));
    }

  }
}

class second_routine extends StatelessWidget{
  final String checkpoint;

  second_routine({Key key, @required this.checkpoint}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("This is the " + checkpoint + " check point"),
      ),
      floatingActionButton: FlatButton(
        onPressed: (){
          Navigator.pop(context);
        },
        color: Color.fromRGBO(255, 255, 0, 1),
        child: Text ("press this to come back"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => third_routine()));
          },
        )
      )
    );
  }
}

class third_routine extends StatefulWidget{
  @override
  _third_routine createState() => _third_routine();
}


class _third_routine extends State<third_routine>{
  bool _visible = false;
  List<GraphData> data = [
    GraphData(
      year: "2000",
      number: 150,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue) ),
    GraphData(
      year: "2001",
      number: 170,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
    )
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("This is third routine"),
      ),
      /*body: Center(
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.
          child: Container(
            child: FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),*/
      body: Center(
        child: GraphDataList (
          data: data
        ),
      ) ,

    );
  }
}


class PredictionScreen extends StatefulWidget{
  @override
  _PredictionScreen createState() => _PredictionScreen();
}
class _PredictionScreen extends State<PredictionScreen>{
  // variable

  var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  var hour = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
  var hour_type =["AM", "PM"];

  String current_day = "Mon";
  String current_hour = "1";
  String current_h_type = "AM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(


        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            DropdownButton(

              items: days.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),

                );
              }).toList(),
              onChanged: (String newValue) {
                setState((){
                  current_day = newValue;
                });
              },
              focusColor: Color.fromRGBO(0, 0, 255, 1),
              iconDisabledColor: Color.fromRGBO(0, 0, 0, 1),
              value: current_day,
            ),
            DropdownButton(
              items: hour.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),

                );
              }).toList(),
              onChanged: (newValue){
                setState(() {
                  current_hour = newValue;
                });
              },
              focusColor: Color.fromRGBO(0, 0, 255, 1),
              iconDisabledColor: Color.fromRGBO(0, 0, 0, 1),
              value: current_hour,
            ),
            DropdownButton(
              items: hour_type.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (newValue){
                setState(() {
                    current_h_type = newValue;
                });
              },
              value: current_h_type,
            )
          ],
        ),
      ),
    );
  }
  void callRoutine(BuildContext context, String routineName, String text){
    if (routineName == "Second"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => second_routine(checkpoint: text) ));
    }

  }
}