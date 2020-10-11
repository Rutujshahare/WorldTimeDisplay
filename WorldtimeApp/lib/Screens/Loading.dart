import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:WorldtimeApp/Servers/worldtime.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupWorldTime()async{
  Worldtime instance=Worldtime(flag:'pakistan.jpg ',location:" Karachi",url:"Asia/Karachi");
   await instance.getTime();
   Navigator.pushReplacementNamed(context, '/Home',arguments: {
    "location":instance.location,
    "time":instance.time,
    "flag":instance.flag,
    "isdaytime":instance.isdaytime,
   });
}
@override
void initState(){
  super.initState();
setupWorldTime();

  
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body:Padding(padding: EdgeInsets.all(12),
      child: Center(
        child:SpinKitFadingCube(
          color:Colors.amberAccent,
          size:80,
        ),
      ),
     
      )
    );
  }
}