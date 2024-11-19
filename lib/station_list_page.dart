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

  List<String> stationList = ['수서','동탄','평택지제','천안아산','오송','대전','김천구미','동대구','경주','울산','부산'];
  List<Widget> stationWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isdeparture?'출발역':'도착역')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          createStation()
        ],
      ),
    );
  }

  //역 리스트 만들기
  Widget createStation(){
    try{
      //이미 선택된 역 리스트에서 제외하기
      if(widget.isdeparture==true){
        stationList.remove(widget.arrival);
        if(!stationList.contains(widget.departure)){
          stationList.add(widget.departure);
        }
      }else if(widget.isdeparture==false){
        stationList.remove(widget.departure);
        if(!stationList.contains(widget.arrival)){
          stationList.add(widget.arrival);
        }
      }
      //위젯에 추가해서 리스트 만들어주기
      for(String name in stationList){
        stationWidgets.add(stationName('$name', context));
        stationWidgets.add(Divider(color: Colors.grey[300], thickness: 0.3));
      }
    return Column(children: stationWidgets);

    }catch(e) {
      print('An error occurred: $e');
      return Column(
        children: [
          Text('데이터를 불러오는 데 실패했습니다.', style: TextStyle(color: Colors.red)),
        ],
      );
    }
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