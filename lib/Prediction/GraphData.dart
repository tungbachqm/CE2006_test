import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;

class GraphData{
  final String time;
  final int number;
  final charts.Color barColor = charts.ColorUtil.fromDartColor(Colors.blue);

  GraphData({
    @required this.time,
    this.number
  });
}