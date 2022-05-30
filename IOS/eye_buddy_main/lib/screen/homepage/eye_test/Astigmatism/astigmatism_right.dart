import 'package:eye_buddy/screen/homepage/eye_test/visual_equity_test/result.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class AstigmatismRight extends StatefulWidget {
  int id;

  int counter;
  AstigmatismRight({this.id, this.counter});
  @override
  _AstigmatismRightState createState() =>
      _AstigmatismRightState(id: id, counter: counter);
}

class _AstigmatismRightState extends State<AstigmatismRight> {
  int id;
  int counter;

  _AstigmatismRightState({this.id, this.counter});

  int counter2 = 0;
  void _incrementCounter() {
    setState(() {
      counter2 = counter2 + 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(context, true);
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'AstigmatismRight',
            style: TextStyle(
              fontFamily: 'TT Commons DemiBold',
              fontSize: 18,
              color: const Color(0xff181d3d),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 220,
                  width: 334,
                  child: Image.asset(
                    'assets/images/Image 3.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Do you see a line (1-2-3-4-5-6-7) that is darker or sharper?',
                  style: TextStyle(
                      fontFamily: 'DemiBold',
                      color: colorFromHex('#181D3D'),
                      fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      height: 40,
                      minWidth: 150,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EyeTestResult(
                                      id: id,
                                      counter: counter,
                                      counter2: counter2,
                                    )));
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            fontFamily: 'DemiBold',
                            color: colorFromHex('#181D3D'),
                            fontSize: 16),
                      ),
                      color: colorFromHex("#FEC62D"),
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 150,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        _incrementCounter();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EyeTestResult(
                                      id: id,
                                      counter: counter,
                                      counter2: counter2,
                                    )));
                      },
                      child: Text(
                        'No',
                        style: TextStyle(
                            fontFamily: 'DemiBold',
                            color: colorFromHex('#FEC62D'),
                            fontSize: 16),
                      ),
                      color: colorFromHex("#181D3D"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
