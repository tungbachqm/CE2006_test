import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;

class GraphData{
  final String year;
  final int number;
  final charts.Color barColor;

  GraphData({
    @required this.year,
    this.number,
    this.barColor
  });
}