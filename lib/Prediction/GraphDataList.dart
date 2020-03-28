import 'package:flutter/material.dart';
import 'package:flutterapp/Prediction/GraphData.dart';
import "package:charts_flutter/flutter.dart" as charts;
class GraphDataList extends StatelessWidget{
  final List<GraphData> data;

  GraphDataList({@ required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<charts.Series<GraphData, String>> series
    = [
      charts.Series(
        id: "Test",
        data: data,
        domainFn: (GraphData series, _) => series.time,
        measureFn: (GraphData series, _) => series.number,
        colorFn: (GraphData series, _) => series.barColor
      )];
    return charts.BarChart(series, animate: true,);
  }
}