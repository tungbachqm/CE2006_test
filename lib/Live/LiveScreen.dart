import 'package:flutter/material.dart';
import 'package:flutterapp/Live/LiveInfoPresent.dart';


class LiveScreen extends StatelessWidget{
  final String checkpoint;

  LiveScreen({Key key, @required this.checkpoint}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text ("This is the " + checkpoint + " check point"),
        ),
        floatingActionButton: FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Color.fromRGBO(255, 255, 0, 1),
          child: Text ("press this to come back"),
        ),
        body: Center(
            child: FlatButton(
              onPressed: (){
                print(getDocID());
                Navigator.push(context, MaterialPageRoute(builder: (context) => LiveInfoShow(time_stamp: getDocID())));
              },
            )
        )
    );
  }

  String getDocID(){
    String ans;
    String now = DateTime.now().toString();
    int final_min;
    if (int.parse(now[15]) > 5 ){
      final_min = 5;
    }
    else{
      final_min = 0;
    }
    ans = checkpoint.substring(0,1) + now.substring(0,15) + final_min.toString() + ":00";
    print(ans);
    return ans;
  }
}
