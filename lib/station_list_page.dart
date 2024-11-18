import 'package:flutter/material.dart';

class StationListPage extends StatefulWidget{

  StationListPage(this.isdeparture,this.departure,this.arrival);
  bool isdeparture;
  String departure;
  String arrival;

  @override
  State<StationListPage> createState() => _StationListPageState();
}

class _StationListPageState extends State<StationListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isdeparture?'출발역':'도착역')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          stationName('수서',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('동탄',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('평택지제',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('천안아산',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('오송',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('대전',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('김천구미',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('동대구',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('경주',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('울산',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
          stationName('부산',context),
          Divider(color: Colors.grey[300],thickness: 0.3,),
        ],
      ),
    );
  }

  Widget stationName(String station,BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context,station);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: 
          Align(
            alignment: Alignment.centerLeft,
            child: Text(station, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
        ),
      ),
    );

  }
}