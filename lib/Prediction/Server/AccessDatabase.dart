import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Prediction/GraphData.dart';



class AccessDataBase{
  int a;
  List<GraphData> ret_list = new List<GraphData>();
  final String uid = "2701";
  CollectionReference live_tuas = Firestore.instance.collection("livetraffic1");
  final DocumentReference live_tuas_1 = Firestore.instance.collection("livetraffoic1").document("2701");
  //Stream<QuerySnapshot> live_doc = live_tuas_1;
  Stream<QuerySnapshot> snap_shot = Firestore.instance.collection("livetraffic1").snapshots();

  final CollectionReference prediction = Firestore.instance.collection("predictionbarchart1");

  AccessDataBase(){}

  Future getData() async{

    live_tuas.getDocuments().then((QuerySnapshot snap){
      print(snap.documents[0].data["numOfCars"]);

    });
    live_tuas.document("2701").get().then((DocumentSnapshot doc){
      print(doc.data["numOfCars"]);
    });

    print("VKL");
  }

  //final CollectionReference live_tuas = Firestore.instance.collection("livetraffic1")

  Future modPredictionData() async{

    prediction.getDocuments().then((QuerySnapshot snap) {
      snap.documents.forEach(
              (doc) => add_to_bar(doc)
      );
    });
    prediction.getDocuments().then((QuerySnapshot snap) {
      snap.documents.forEach(
              (doc) => print(doc.data["oldImageID"])

      );
    });
    prediction.getDocuments().then((QuerySnapshot snap) {
      snap.documents.forEach(
              (doc) => assignTo(doc)
      );
    });

    prediction.document("t-2020-02-10-06-01").get().then((DocumentSnapshot doc){
      print(doc.data.keys);
      add_to_bar(doc);
    });

    //ret_list.add(GraphData(time:"123", number: 12));
    print("DCMMM");
    print(ret_list.isEmpty);
    ret_list.forEach((data) =>
      print(data.number)
    );

  }

  Future add_to_bar (DocumentSnapshot doc) async{
    ret_list.add(GraphData(time: doc.data["oldImageID"], number: int.parse(doc.data["avgCarsHour"])));
  }
  void assignTo(DocumentSnapshot doc){
    print("Hello CMM");
    a = int.parse(doc.data["avgCarsHour"]);
    print (a);
  }


}