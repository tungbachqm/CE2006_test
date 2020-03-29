import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutterapp/Prediction/PredictionSpecificHourpage.dart';
import 'package:flutterapp/Prediction/predictionweekpage.dart';


class PredictionScreen extends StatefulWidget{
  @override
  _PredictionScreen createState() => _PredictionScreen(checkpoint: checkpoint);

  String checkpoint;
  PredictionScreen({
    this.checkpoint,
  });
}


class _PredictionScreen extends State<PredictionScreen>{
  // variable


  var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  var hour = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
  var hour_type =["AM", "PM"];

  String current_day = "Mon";
  String current_hour = "1";
  String current_h_type = "AM";
  String checkpoint;

  //var now = new DateTime.now();

  final TopSection = new Container(
    child: Text("Please enter your choice"),
  );

  _PredictionScreen({
    this.checkpoint,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TopSection,
            Container(
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
            Container(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionHour()));
                    },
                    child: Text("Prediction with specific hour")
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionWeekPage()));
                    },
                    child: Text("Prediction for all day"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

