
import 'package:intl/intl.dart';
import "package:http/http.dart";
import 'dart:convert';

class Worldtime{
  String location;
  String time;
  String url;
  String flag;
  bool isdaytime;
  
  Worldtime({this.flag,this.location,this.url});



Future<void> getTime() async{

  try{
Response response= await get("http://worldtimeapi.org/api/timezone/$url");
Map data=jsonDecode(response.body);
print(data);
String datetime= data['datetime'];
String offsethours=data['utc_offset'].substring(1,3);
String offsetminutes=data['utc_offset'].substring(4,6);
print(datetime);

DateTime now=DateTime.parse(datetime);
now=now.add(Duration(hours:int.parse(offsethours),minutes: int.parse(offsetminutes)));
isdaytime=now.hour>6 && now.hour<20 ? true:false;
time=DateFormat.jm().format(now);
print(data);

  }
  catch(e){
   print(" Error caught $e");
   time= "the data not connected or there is a fault in the data";
  }
  

}

}





