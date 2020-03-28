import 'package:flutter/material.dart';
import 'package:flutterapp/Prediction/GraphData.dart';
import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutterapp/Prediction/Server/AccessDatabase.dart';
import "GraphDataList.dart";

class BarChartShow extends StatefulWidget{
  @override
  _BarChartShow createState() => _BarChartShow(acc: acc);
  AccessDataBase acc;
  BarChartShow(

  {

  this.acc

  });
}

class _BarChartShow extends State<BarChartShow> {

  AccessDataBase acc;
  _BarChartShow({
    this.acc
  });
  //List<GraphData> data = new List<GraphData>();



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
        child: GraphDataList(
            data: acc.ret_list
        ),
      ),

    );
  }
}