import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/cupertino.dart';

class AccessDataBase{
  final String uid = "2701";
  final CollectionReference live_tuas = Firestore.instance.collection("livetraffic1");
  var live_tuas_1 = Firestore.instance.collection("livetraffoic1").document("2701");
  Stream<QuerySnapshot> live_doc = live_tuas_1;
  var live_tuas_doc;
  /*AccessDataBase({
    this.uid
  });*/

  Future getData() async{
    /*var document = await Firestore.instance.document('livetraffic1/2701');
    print(document.hashCode["numberOfCars"]);*/
    //(live_tuas_1.snapshots().forEach((f) => print(f.data.keys)));
    live_tuas_doc = live_tuas.document("2701").snapshots.doc
    live_tuas
        .getDocuments()
        .then((QuerySnapshot snapshot){
      snapshot.documents.forEach((f) => print(f.data["numOfCars"]));
    });
    print("VKL");
  }
  //final CollectionReference live_tuas = Firestore.instance.collection("livetraffic1");

}