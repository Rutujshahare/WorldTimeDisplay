

import 'package:WorldtimeApp/Servers/worldtime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

List<Worldtime> locations=[
  Worldtime(url:"Asia/Kolkata",location:"Kolkata",flag:"india.png"),
   Worldtime(url:"Asia/Karachi",location:"Karachi",flag:"pakistan.jpg"),
    Worldtime(url:"Asia/Kathmandu",location:"Kathmandu",flag:"bhutan.png"),
     Worldtime(url:"Asia/Tokyo",location:"Tokyo",flag:"japan.png"),
      Worldtime(url:"Asia/Kabul",location:"Kabul",flag:"afganistan.png"),
       Worldtime(url:"Asia/Dhaka",location:"Dhaka",flag:"bangladesh.png"),
        Worldtime(url:"Asia/Seoul",location:"Seoul",flag:"china.jpg"),
         Worldtime(url:"Asia/Dubai",location:"Dubai",flag:"saudi arabia.png"),
          Worldtime(url:"Asia/Singapore",location:"Singapore",flag:"thailand.png"),
           Worldtime(url:"Asia/Colombo",location:"Colombo",flag:"sri lanka.png"),
];

void updatetime(index) async{
  Worldtime instance=locations[index];
  await instance.getTime();
  Navigator.pop(context,{
    "location":instance.location,
    "time":instance.time,
    "flag":instance.flag,
    "isdaytime":instance.isdaytime,
  });
}


  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
       
        title: Text(" Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent[400],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:1.0,vertical:4.0),
            child: Card(
              child:ListTile(
                 onTap: (){
                 updatetime(index);
                 },
                 title: Text(locations[index].location),
                 leading: CircleAvatar(
                   backgroundImage:AssetImage("Assets/images/${locations[index].flag}"),
                   maxRadius: 32,
                 ),
              ),
            ),
          );
        }),

     
    );
      
 
     
    
  }
}