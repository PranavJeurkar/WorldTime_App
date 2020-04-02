import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime>locations=[
    WorldTime(url:'Europe/Berlin',location:'Berlin',flag:'germany.png'),
    WorldTime(url:'Africa/Cairo',location:'Cairo',flag:'africa.png'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag:'america.png'),
    WorldTime(url:'Asia/Dubai',location:'Dubai',flag:'dubai.png'),
    WorldTime(url:'Antarctica/Davis',location:'Davis',flag:'davis.png'),
    WorldTime(url:'Pacific/Fiji',location:'Fiji',flag:'fiji.png'),
    WorldTime(url:'Asia/Jakarta',location:'Jakarta',flag:'indonesia.png'),
    WorldTime(url:'Asia/Kolkata',location:'Kolkata',flag:'india.png'),
    WorldTime(url:'Europe/London',location:'London',flag:'uk.png'),
    WorldTime(url:'Australia/Melbourne',location:'Melbourne',flag:'aus.png'),
    WorldTime(url:'Indian/Maldives',location:'Maldives',flag:'maldives.png'),
    WorldTime(url:'Indian/Mauritius',location:'Mauritius',flag:'mauritius.png'),
    WorldTime(url:'Europe/Moscow',location:'Moscow',flag:'moscow.png'),
    WorldTime(url:'Europe/Paris',location:'Paris',flag:'paris.png'),
    WorldTime(url:'Australia/Sydney',location:'Sydney',flag:'aus.png'),
    WorldTime(url:'Asia/Tokyo',location:'Tokyo',flag:'japan.png'),

  ];
  void updateTime(index)async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    } );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: Colors.grey[200],
     appBar: AppBar(
       backgroundColor:Colors.blue[900],
       title:Text('Choose Location'),
       centerTitle: true,
       elevation: 0,


     ),
     body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap:() {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading:CircleAvatar(
                  backgroundImage: AssetImage('assests/${locations[index].flag}'),
                ) ,
              ),
            ),
          );
        },
    ),

    );
  }
}
