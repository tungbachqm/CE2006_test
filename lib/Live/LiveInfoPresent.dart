import 'package:flutter/material.dart';
import "dart:async";
import "dart:core";
import "package:cloud_firestore/cloud_firestore.dart";
class LiveInfoShow extends StatefulWidget{
  @override
  _LiveInfoShow createState() => _LiveInfoShow(time_stamp: time_stamp);

  String time_stamp;
  LiveInfoShow({
    this.time_stamp,
  });


}

class _LiveInfoShow extends State<LiveInfoShow>{
  CollectionReference data = Firestore.instance.collection("dummy_data");
  String time_stamp;
  _LiveInfoShow({
    this.time_stamp,
  });

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
              child: Text("This is your live data: ")
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    StreamBuilder(
                      stream: data.document(time_stamp).snapshots(),
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