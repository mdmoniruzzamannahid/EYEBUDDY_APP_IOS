import 'package:eye_buddy/screen/homepage/eye_test/visual_equity_test/instruction_right.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AmdLeft extends StatefulWidget {
  int id;
  int slide;
  AmdLeft({this.id, this.slide});
  @override
  _AmdLeftState createState() => _AmdLeftState(id: id, slide: slide);
}

class _AmdLeftState extends State<AmdLeft> {
  int id;
  int slide;
  _AmdLeftState({this.id, this.slide});
  int counter = 0;
  int slideIndex = 0;
  PageController controller;
  void _incrementCounter() {
    setState(() {
      counter = counter + 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
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
          'AMD Test',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: hw * 0.8,
                  child: Image.asset(
                    'assets/images/amdtest.PNG',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Concentrate on the central point in the grid without moving your gaze. Do you see any strong distortions in certain lines?',
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
                                builder: (context) => VisualEquityIntroRight(
                                      id: id,
                                      counter: counter,
                                    )));
                        print(counter);
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
                                builder: (context) => VisualEquityIntroRight(
                                      id: id,
                                      counter: counter,
                                    )));
                        print(counter);
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
