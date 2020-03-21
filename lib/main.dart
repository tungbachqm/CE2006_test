// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutterapp/GraphDataList.dart';
import "GraphData.dart";

void main() => runApp(MaterialApp(
  home: TestApp(),
));


class TestApp extends StatelessWidget {
  // variable
  var checkpointLive = ["Live", "Tuas", "WoodLand"];
  var checkpointPrediction = ["Prediction", "Tuas", "WoodLand"];
  String live = "1";
  String predict = "2";
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

                items: checkpointLive.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),

                  );
                }).toList(),
                onChanged: (String text){
                    if (text != "Live") {
                      callRoutine(context, "Second", text);
                    }
                },
                focusColor: Color.fromRGBO(0, 0, 255, 1),
                iconDisabledColor: Color.fromRGBO(0, 0, 0, 1),
                value: checkpointLive[0],
              ),
              DropdownButton(

                items: checkpointPrediction.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),

                  );
                }).toList(),
                onChanged: (String text){
                  if (text != "Prediction") {
                    callRoutine(context, "Second", text);
                  }
                },
                focusColor: Color.fromRGBO(0, 0, 255, 1),
                iconDisabledColor: Color.fromRGBO(0, 0, 0, 1),
                value: checkpointPrediction[0],
              ),


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