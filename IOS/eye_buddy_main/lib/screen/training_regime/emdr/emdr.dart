import 'package:eye_buddy/screen/calender_screen.dart';
import 'package:eye_buddy/screen/training_regime/acct_chart_to_f.dart';
import 'package:eye_buddy/screen/training_regime/emdr/start.dart';
import 'package:eye_buddy/screen/training_regime/exercise_set.dart';
import 'package:eye_buddy/screen/training_regime/supporting_video.dart';
import 'package:eye_buddy/screen/training_regime/training_regime.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Emdr extends StatefulWidget {
  @override
  _EmdrState createState() => _EmdrState();
}

class _EmdrState extends State<Emdr> {
  String uid;
  String aCollection = "AcEMDR";

  List<String> videoList = [
    '1IPsBPH2M1U',
    'M2ra8p4MSOk',
    'iGGJrqscvtU',
  ];

  @override
  void initState() {
    // TODO: implement initState

    try {
      uid = FirebaseAuth.instance.currentUser.uid;
      if (uid != null) {
        AcctCharttoF.saveToDatabase(aCollection, uid);
      }
    } catch (e) {
      print(e);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrainingRegime()));
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Emdr',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartSession()));
                },
                child: _traing_card(h, w, 'start-button', 'Start Session'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalenderScreen(aCollection, uid)));
                },
                child: _traing_card(
                    h, w, 'Accountability Chart', 'Accountability Chart'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SupportingVideos(videoList)));
                },
                child: _traing_card(
                    h, w, 'Supporting videos', 'Supporting videos'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _traing_card(double h, double w, String asset, String name) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x181D3D).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 40,
              offset: Offset(0, 3),
            )
          ],
        ),
        height: h * 0.1,
        width: h * 0.7,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Container(
                      width: w*0.1,
                      child:
                          SvgPicture.asset("assets/svg/treatment/$asset.svg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: w * 0.48,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontFamily: 'TTCommons Demibold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                    "assets/svg/training_regime/right_arrow.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
