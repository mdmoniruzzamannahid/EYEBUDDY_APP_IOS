import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalenderScreen extends StatefulWidget {
  String aCollection;
  String uid;
  CalenderScreen(this.aCollection, this.uid);
  //const CalenderScreen({Key key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState(aCollection, uid);
}

class _CalenderScreenState extends State<CalenderScreen> {
  String aCollection;
  String uid;
  _CalenderScreenState(this.aCollection, this.uid);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  Map<DateTime, List<String>> _events;
  List eventDateList = [
    // '2021-11-15',
    // '2021-11-14',
  ];

  @override
  void initState() {
    // TODO: implement initState
    if (uid != null) {
      FirebaseFirestore.instance
          .collection(aCollection)
          .doc(uid)
          .get()
          .then((value) {
        for (var dTime in value.data()['dateTime']) {
          print(dTime.toDate().toString().split(" ")[0].toString());
          eventDateList.add(dTime.toDate().toString().split(" ")[0].toString());
        }
        print(eventDateList.toString());
        setState(() {});
        //  print(value.data()['dateTime']);
      });
    }

    super.initState();

    // _events = {
    //   DateTime(2021, 6, 22): [
    //     'Meeting URUS',
    //     'Testing Danai Mobile',
    //     'Weekly Report',
    //     'Weekly Meeting'
    //   ],
    //   DateTime(2021, 10, 25): ['Weekly Testing'],
    //   DateTime(2021, 10, 4): ['Weekly Testing'],
    //   DateTime(2021, 10, 11): ['Weekly Testing'],
    //   DateTime(2021, 10, 18): ['Weekly Testing'],
    // };
    // _events.keys.forEach((element) {
    //   eventDateList.add(element.toString().split(" ")[0]);
    //   print(element.toString().split(" ")[0]);
    // });

    // print(_events.keys.elementAt(1).toString().split(" ")[0].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Home(
              //               newSelectedIndex: 1,
              //             )));
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ACCOUNTABILITY CHART',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: eventDateList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Yes"),
                              ],
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.red[300],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("No")
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                TableCalendar(
                  // events: _events,
                  // calendarController: CalendarController(),
                  //  initialCalendarFormat: _calendarFormat,
                  firstDay: DateTime.utc(2021, 10, 16),
                  lastDay: _focusedDay,
                  // lastDay: DateTime.utc(2022, 1, 30),
                  focusedDay: _focusedDay,
                  headerStyle: HeaderStyle(formatButtonVisible: false),
                  calendarBuilders: CalendarBuilders(
                      prioritizedBuilder: (context, date, events) {
                    print(date.toString());
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: date.isAfter(DateTime.now())
                            ? Colors.white
                            : eventDateList
                                    .contains(date.toString().split(" ")[0])
                                ? Colors.green
                                : Colors.red[300],

                        // color: eventDateList
                        //             .contains(date.toString().split(" ")[0])
                        //         ? Colors.green
                        //         : Colors.red[300],
                        // color: date.day == 11 ? Colors.green : Colors.red[200],
                        child: Center(child: Text(date.day.toString())),
                      ),
                    );
                  }),
                ),
              ],
            ),
    );
  }
}
