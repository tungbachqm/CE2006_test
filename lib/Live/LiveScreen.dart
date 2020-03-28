import 'package:flutter/material.dart';


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
            /*child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => third_routine()));
              },
            )*/
        )
    );
  }
}
