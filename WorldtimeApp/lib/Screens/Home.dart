import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
   data=data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;
   print(data);
   String bgimage=data['isdaytime'] ? "daylight.jpg":"night.jpg";
   Color bgcolor=data['isdaytime'] ? Colors.amberAccent:Colors.black;
    return Scaffold(
     
    backgroundColor: bgcolor,
       body: Container(
         decoration: BoxDecoration(
           image:DecorationImage(
             image:AssetImage("Assets/images/$bgimage") ,
             fit: BoxFit.cover,
             
             ),
         ),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0,100,0,0),
           child: SafeArea(
            child: Column(
              children: <Widget>[
                    RaisedButton.icon(onPressed: () async{
                      dynamic result =await Navigator.pushNamed(context, '/Location');
                      setState(() {
                        data={
                         'time':result['time'],
                         'location':result['location'],
                         'flag':result['flag'],
                         'isdaytime':result['isdaytime'],
                        };
                      });
                    }, icon: Icon(Icons.edit_location), label: Text(" Choose Location"),),
                   SizedBox(height:20),

                   Row(
                  
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:<Widget>[
                       Text(
                         data['location'],
                         style:TextStyle(
                           fontWeight:FontWeight.bold,
                           fontFamily: 'Lobster',
                           fontSize: 38, 
                           color: Colors.blueAccent[400],
                         ),
                       ),
                       SizedBox(height:35),

                       
                     ],
                   ),

                   Text(
                         data['time'],
                         style:TextStyle(fontSize: 45,
                         fontFamily: 'Lobster',
                         fontWeight: FontWeight.w300,
                         color:Colors.cyan[600]
                         ),
                       )
                    
      ],
      ),
      ),
         ),
       ),
    );
  }
}