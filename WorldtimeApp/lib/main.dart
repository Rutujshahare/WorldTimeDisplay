

import 'package:WorldtimeApp/Screens/Home.dart';
import 'package:WorldtimeApp/Screens/Loading.dart';
import 'package:WorldtimeApp/Screens/Location.dart';
import "package:flutter/material.dart";
void main()=>runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/':(context)=>Loading(),
    '/Home':(context)=>Home(),
    '/Location':(context)=>Location(),
  } ,
));

