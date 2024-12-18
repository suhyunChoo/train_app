import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //사용자가 터치한 게 출발역인지 도착역인지 알려주기 위한 변수
  bool isdeparture = true;
  String departure = '선택';
  String arrival = '선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '출발역',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      GestureDetector(
                          onTap: () async {
                            isdeparture = true;
                            final selectedStation = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return StationListPage(
                                      isdeparture, departure, arrival);
                                },
                              ),
                            );
                            if (selectedStation != null) {
                              setState(() {
                                departure = selectedStation;
                              });
                            }
                          },
                          child:
                              Text(departure, style: TextStyle(fontSize: 40))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: 2, // 선의 너비
                      height: 50, // 선의 높이
                      color: Colors.grey, // 선의 색상
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '도착역',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      GestureDetector(
                          onTap: () async {
                            isdeparture = false;
                            final selectedStation = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return StationListPage(
                                      isdeparture, departure, arrival);
                                },
                              ),
                            );
                            if (selectedStation != null) {
                              setState(() {
                                arrival = selectedStation;
                              });
                            }
                          },
                          child: Text(arrival, style: TextStyle(fontSize: 40))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).highlightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (arrival != '선택' && departure != '선택') {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SeatPage(departure, arrival);
                        },
                      ));
                    }
                  },
                  child: Text(
                    "좌석 선택",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
