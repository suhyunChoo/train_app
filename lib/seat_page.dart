import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';

class SeatPage extends StatefulWidget {
  SeatPage(this.departure, this.arrival);

  String departure;
  String arrival;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  String? selectedCol;

  late void Function(int row, String col) onselected;

  @override
  void initState() {
    super.initState();

    onselected = (int row, String col) {
      setState(() {
        selectedRow = row;
        selectedCol = col;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석선택'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.departure,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.arrival,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ],
            ),
          ),
          //선택됨, 선택안됨 박스
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label('선택됨', Colors.purple),
                SizedBox(width: 20),
                label('선택안됨', Colors.grey[300]!),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //abcd 좌석 열
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textLabel('A'),
              SizedBox(width: 4),
              textLabel('B'),
              SizedBox(width: 4),
              textLabel(' '),
              SizedBox(width: 4),
              textLabel('C'),
              SizedBox(width: 4),
              textLabel('D'),
            ],
          ),
          //리스트뷰
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 2, right: 2),
                  child: row(index + 1, context),
                );
              },
            ),
          ),
          //버튼
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 모서리 둥글게 설정
                  ),
                ),
                onPressed: () {
                  try {
                    if (widget.departure != '선택' && widget.arrival != '선택') {
                      onselected(selectedRow!, selectedCol!);
                      showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('예매 하시겠습니까?'),
                              content: Text('좌석 $selectedRow - $selectedCol'),
                              actions: [
                                CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('취소')),
                                CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return HomePage();
                                        },
                                      ));
                                    },
                                    child: Text('확인')),
                              ],
                            );
                          });
                    }
                  } catch (e) {
                    print("예외 발생: $e");
                  }
                },
                child: Text(
                  "예매 하기",
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
    );
  }

  Column textLabel(String text) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column label(String text, Color color) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  Widget row(int rowNum, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          seat(rowNum, 'A', context),
          SizedBox(width: 4),
          seat(rowNum, 'B', context),
          SizedBox(width: 4),
          Center(
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                '$rowNum',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 4),
          seat(rowNum, 'C', context),
          SizedBox(width: 4),
          seat(rowNum, 'D', context),
        ],
      ),
    );
  }

  Widget seat(int rowNum, String colNum, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: () {
          onselected(rowNum, colNum);
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: rowNum == selectedRow && colNum == selectedCol
                ? Colors.purple
                : Colors.grey[300]!,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
