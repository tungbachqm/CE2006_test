import 'package:flutter/material.dart';
import "dart:core";
import "package:cloud_firestore/cloud_firestore.dart";
class PredictionHour extends StatefulWidget{
  @override
  _PredictionHour createState() => _PredictionHour();
}

class _PredictionHour extends State<PredictionHour>{
  CollectionReference data = Firestore.instance.collection("livetraffic1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text ("This is the live view"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Container(
                child: Text("This is your prediction data for hour: ")
            ),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StreamBuilder(
                      stream: data.document("2702").snapshots(),
                      builder: (context, snapshot){
                        if (!snapshot.hasData){
                          return Text("Loagding...");
                        }
                        else {
                          return Text("The number of car is: " + snapshot.data.data["numOfCars"]);
                        }
                      },
                    ),
                  ],
                )
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("The weather is: "),
                ],
              ),
            )

          ],
        )

    );
  }
}