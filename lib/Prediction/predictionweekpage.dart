import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Prediction/predictiondata.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PredictionWeekPage extends StatefulWidget {
  @override
  _PredictionWeekPageState createState() {
    return _PredictionWeekPageState();
  }
}

class _PredictionWeekPageState extends State<PredictionWeekPage> {
  List<charts.Series<Predictiondata, String>> _predictionWeekBarData;
  List<Predictiondata> mydata;
  _generateData(mydata) {
    _predictionWeekBarData = List<charts.Series<Predictiondata, String>>();
    _predictionWeekBarData.add(
      charts.Series(
        domainFn: (Predictiondata predictiondata, _) => predictiondata.day.toString(), //x-axis
        measureFn: (Predictiondata predictiondata, _) => predictiondata.cars, // y-axis
//        colorFn: (Predictiondata sales, _) =>
//            charts.ColorUtil.fromDartColor(Color(int.parse(sales.colorVal))),
        id: 'Predictiondata',
        data: mydata,
        labelAccessorFn: (Predictiondata row, _) => "${row.cars}",
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Predictiondata')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('predictionWeek').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Predictiondata> predictionweekdata = snapshot.data.documents
              .map((documentSnapshot) => Predictiondata.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, predictionweekdata);
        }
      },
    );
  }
  Widget _buildChart(BuildContext context, List<Predictiondata> predictionweekdata) {
    mydata = predictionweekdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Sales by Year',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(_predictionWeekBarData, // x-axis, y-axis, color
                  animate: true,
                  animationDuration: Duration(seconds:3),
                  behaviors: [
//                    new charts.DatumLegend(
//                      entryTextStyle: charts.TextStyleSpec(
//                          color: charts.MaterialPalette.purple.shadeDefault,
//                          fontFamily: 'Georgia',
//                          fontSize: 18),
//                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}