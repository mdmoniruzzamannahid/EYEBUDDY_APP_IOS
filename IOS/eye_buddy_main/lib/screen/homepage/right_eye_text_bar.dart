import 'package:eye_buddy/util/colorconfig.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RightEyeTestBar extends StatefulWidget {
  @override
  _RightEyeTestBarState createState() => _RightEyeTestBarState();
}

class _RightEyeTestBarState extends State<RightEyeTestBar> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  String dropdownValue = 'Color Blind Test';

  var firstWeekTestResult = 0.0;
  var secondWeekTestResult = 0.0;
  var thirdWeekTestResult = 0.0;
  var fourthWeekTestResult = 0.0;

  Future getTestResult(testType) async {
    var userID = FirebaseAuth.instance.currentUser.uid;

    DateTime now = DateTime.now();
    DateTime startDate = DateTime(now.year, now.month, 01, 00, 00, 00);
    print("*****$startDate");
    DateTime endDate = DateTime(now.year, now.month, 31, 23, 59, 59);
    print("*****$endDate");
    print("*************Test");
    await FirebaseFirestore.instance
        .collection("EyeTestResult")
        .where("userID", isEqualTo: userID)
        .where("testType", isEqualTo: testType)
        // .where('dateTime', isGreaterThanOrEqualTo: startDate)
        //  .where('dateTime', isLessThanOrEqualTo: endDate)
        .get()
        .then((value) {
      print("*******${value.docs[0]['dateTime'].toDate()}");
      value.docs.forEach((element) {
        int testDate = int.parse(element
            .data()["dateTime"]
            .toDate()
            .toString()
            .split(" ")[0]
            .toString()
            .split("-")[2]);
        print("*****$testDate");
        int testYear = int.parse(element
            .data()["dateTime"]
            .toDate()
            .toString()
            .split(" ")[0]
            .toString()
            .split("-")[0]);
        print("*****$testDate");
        int testMonth = int.parse(element
            .data()["dateTime"]
            .toDate()
            .toString()
            .split(" ")[0]
            .toString()
            .split("-")[1]);
        print("*****$testDate");

        if (testYear == DateTime.now().year &&
            testMonth == DateTime.now().month) {
          if (testDate >= 1 && testDate <= 7) {
            this.firstWeekTestResult =
                this.firstWeekTestResult + element.data()["rightEyeResult"];
          }
          if (testDate >= 8 && testDate <= 14) {
            this.secondWeekTestResult =
                this.secondWeekTestResult + element.data()["rightEyeResult"];
          }
          if (testDate >= 15 && testDate <= 21) {
            this.thirdWeekTestResult =
                this.thirdWeekTestResult + element.data()["rightEyeResult"];
          }
          if (testDate >= 22 && testDate <= 31) {
            this.fourthWeekTestResult =
                this.fourthWeekTestResult + element.data()["rightEyeResult"];
          }
        }
      });

      setState(() {});

      print(firstWeekTestResult);
      print(secondWeekTestResult);
      print(thirdWeekTestResult);
      print(fourthWeekTestResult);
    });
  }

  bool firstCall = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (firstCall) {
      getTestResult("ColorBlindTest");
      firstCall = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Container(
      width: hw * 0.5 - 20,
      height: 120,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              height: 20,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Right Eye'),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 20,
                        elevation: 10,
                        style: TextStyle(color: ColorConfig.black),
                        onChanged: (String newValue) {
                          firstWeekTestResult = 0.0;
                          secondWeekTestResult = 0.0;
                          thirdWeekTestResult = 0.0;
                          fourthWeekTestResult = 0.0;
                          getTestResult(newValue
                              .toString()
                              .replaceAll(" ", "")
                              .toString());
                          setState(() {
                            dropdownValue = newValue;

                            print(dropdownValue.toString().replaceAll(" ", ""));
                          });
                        },
                        items: <String>[
                          'Astigmatism Test',
                          'Near Vision Test',
                          'Visual Acuity Test',
                          'AMD Test',
                          'Light Sensitivity Test',
                          'Color Blind Test'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 6),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: hw * 0.5 - 50,
              height: 80,
              child: LineChart(
                mainData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        leftTitles: SideTitles(showTitles: false),
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (BuildContext context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 6),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1st Week';
              case 2:
                return '2nd Week';
              case 3:
                return '3rd Week';
              case 4:
                return '4th Week';
            }
            return '';
          },
          // margin: 8,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, firstWeekTestResult / 35),
            FlSpot(1.6, secondWeekTestResult / 35),
            FlSpot(2.9, thirdWeekTestResult / 35),
            FlSpot(3.9, fourthWeekTestResult / 35),
          ],
          isCurved: true,
          colors: [ColorConfig.yeallow],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          // belowBarData: BarAreaData(
          //   show: true,
          // colors:
          //     gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          // ),
        ),
      ],
    );
  }
}
