import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/homepage/profile.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EyeGlassChart extends StatefulWidget {
  var userID;
  String oDSphereC;
  String oDCylindricalC;
  String oDAxisC;
  String oDPSC;
  String oDADDC;
  String oSSphereC;
  String oSCylindricalC;
  String oSAxisC;
  String oSPSC;
  String oSADDC;
  bool eyeGlassChartDate;
  EyeGlassChart(
      {this.userID,
      this.oDSphereC,
      this.oDCylindricalC,
      this.oDAxisC,
      this.oDPSC,
      this.oDADDC,
      this.oSSphereC,
      this.oSCylindricalC,
      this.oSAxisC,
      this.oSPSC,
      this.oSADDC,
      this.eyeGlassChartDate});
  @override
  _EyeGlassChartState createState() => _EyeGlassChartState(
      userID: userID,
      oDSphereC: oDSphereC,
      oDCylindricalC: oDCylindricalC,
      oDAxisC: oDAxisC,
      oDPSC: oDPSC,
      oDADDC: oDADDC,
      oSSphereC: oSSphereC,
      oSCylindricalC: oSCylindricalC,
      oSAxisC: oSAxisC,
      oSPSC: oSPSC,
      oSADDC: oSADDC,
      eyeGlassChartDate: eyeGlassChartDate);
}

class _EyeGlassChartState extends State<EyeGlassChart> {
  var userID;
  String oDSphereC;
  String oDCylindricalC;
  String oDAxisC;
  String oDPSC;
  String oDADDC;
  String oSSphereC;
  String oSCylindricalC;
  String oSAxisC;
  String oSPSC;
  String oSADDC;
  bool eyeGlassChartDate;
  _EyeGlassChartState(
      {this.userID,
      this.oDSphereC,
      this.oDCylindricalC,
      this.oDAxisC,
      this.oDPSC,
      this.oDADDC,
      this.oSSphereC,
      this.oSCylindricalC,
      this.oSAxisC,
      this.oSPSC,
      this.oSADDC,
      this.eyeGlassChartDate});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oDSphere = oDSphereC;
    oDCylindrical = oDCylindricalC;
    oDAxis = oDAxisC;
    oDPS = oDPSC;
    oDADD = oDADDC;
    oSSphere = oSSphereC;
    oSCylindrical = oSCylindricalC;
    oSAxis = oSAxisC;
    oSPS = oSPSC;
    oSADD = oSADDC;
  }

  TextEditingController oDSphereController = TextEditingController();
  TextEditingController oDCylindricalController = TextEditingController();
  TextEditingController oDAxisController = TextEditingController();
  TextEditingController oDPSController = TextEditingController();
  TextEditingController oDADDController = TextEditingController();
  TextEditingController oSSphereController = TextEditingController();
  TextEditingController oSCylindricalController = TextEditingController();
  TextEditingController oSAxisController = TextEditingController();
  TextEditingController oSPSController = TextEditingController();
  TextEditingController oSADDController = TextEditingController();

  String oDSphere;
  String oDCylindrical;
  String oDAxis;
  String oDPS;
  String oDADD;
  String oSSphere;
  String oSCylindrical;
  String oSAxis;
  String oSPS;
  String oSADD;

  Future sendDataToServer() async {
    oDSphere =
        oDSphereController.text == "" ? oDSphere : oDSphereController.text;
    oDCylindrical = oDCylindricalController.text == ""
        ? oDCylindrical
        : oDCylindricalController.text;
    oDAxis = oDAxisController.text == "" ? oDAxis : oDAxisController.text;
    oDPS = oDPSController.text == "" ? oDPS : oDPSController.text;
    oDADD = oDADDController.text == "" ? oDADD : oDADDController.text;
    oSSphere =
        oSSphereController.text == "" ? oSSphere : oSSphereController.text;
    oSCylindrical = oSCylindricalController.text == ""
        ? oSCylindrical
        : oSCylindricalController.text;
    oSAxis = oSAxisController.text == "" ? oSAxis : oSAxisController.text;
    oSPS = oSPSController.text == "" ? oSPS : oSPSController.text;
    oSADD = oSADDController.text == "" ? oSADD : oSADDController.text;

    print(oDSphere);

    // await FirebaseFirestore.instance
    //     .collection("EyeGlassChart")
    //     .where("userID", isEqualTo: userID)
    //     .get()
    //     .then((value) {
    //   print(value.docs.length);

    if (!eyeGlassChartDate) {
      FirebaseFirestore.instance.collection("EyeGlassChart").doc(userID).set({
        'oDSphere': oDSphere,
        'oDCylindrical': oDCylindrical,
        'oDAxis': oDAxis,
        'oDPS': oDPS,
        'oDADD': oDADD,
        'oSSphere': oSSphere,
        'oSCylindrical': oSCylindrical,
        'oSAxis': oSAxis,
        'oSPS': oSPS,
        'oSADD': oSADD,
        'userID': userID,
        'dateTime': DateTime.now(),
      }).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      });
    } else {
      FirebaseFirestore.instance
          .collection("EyeGlassChart")
          .doc(userID)
          .update({
        'oDSphere': oDSphere,
        'oDCylindrical': oDCylindrical,
        'oDAxis': oDAxis,
        'oDPS': oDPS,
        'oDADD': oDADD,
        'oSSphere': oSSphere,
        'oSCylindrical': oSCylindrical,
        'oSAxis': oSAxis,
        'oSPS': oSPS,
        'oSADD': oSADD,
        'userID': userID,
        'dateTime': DateTime.now(),
      }).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      newSelectedIndex: 4,
                    )));
      });
    }
    //});
  }

  @override
  Widget build(BuildContext context) {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    final headingStyle = TextStyle(
      fontSize: hw * 0.05,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    final bodyStyle = TextStyle(
      fontSize: hw * 0.04,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    final normalStyle = TextStyle(
      fontSize: hw * 0.03,
      color: Colors.black,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Eye Glass Chart",
            style: TextStyle(fontSize: 18, color: colorFromHex('#181D3D')),
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
              child: Image.asset('assets/icon/back_arrow.png'),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Table(
                      border: TableBorder.all(
                          width: 1,
                          color: ColorConfig.yeallow,
                          style: BorderStyle.solid),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rx',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Sphere',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Cylindrical',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Axis',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('PS',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('ADD',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('OD',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(
                              signed: true,
                              decimal: true,
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText:
                                    '${eyeGlassChartDate ? oDSphere : 0}'),
                            controller: oDSphereController,
                          ),
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText:
                                    '${eyeGlassChartDate ? oDCylindrical : 0}'),
                            controller: oDCylindricalController,
                          ),
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: '${eyeGlassChartDate ? oDAxis : 0}'),
                            controller: oDAxisController,
                          ),
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: '${eyeGlassChartDate ? oDPS : 0}'),
                            controller: oDPSController,
                          ),
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: '${eyeGlassChartDate ? oDADD : 0}'),
                            controller: oDADDController,
                          ),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('OS',
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'TTCommon')),
                            )
                          ]),
                          TextField(
                            controller: oSSphereController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: '${eyeGlassChartDate ? oSSphere : 0}',
                            ),
                          ),
                          TextField(
                            controller: oSCylindricalController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText:
                                    '${eyeGlassChartDate ? oSCylindrical : 0}'),
                          ),
                          TextField(
                            controller: oSAxisController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: '${eyeGlassChartDate ? oSAxis : 0}'),
                          ),
                          TextField(
                            controller: oSPSController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: '${eyeGlassChartDate ? oSPS : 0}'),
                          ),
                          TextField(
                            controller: oSADDController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: '${eyeGlassChartDate ? oSADD : 0}'),
                          ),
                        ]),
                      ]),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      height: 40,
                      minWidth: hw * 0.4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(
                                      newSelectedIndex: 4,
                                    )));
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'DemiBold',
                            color: ColorConfig.black,
                            fontSize: 16),
                      ),
                      color: ColorConfig.yeallow,
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: hw * 0.4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        sendDataToServer();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'DemiBold',
                          color: ColorConfig.black,
                          fontSize: 16,
                        ),
                      ),
                      color: ColorConfig.yeallow,
                    ),
                  ],
                ),
                SizedBox(
                  height: hp * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sample Eye Glass Chart: EYE BUDDY',
                    style: headingStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'First the Basics (What do the Numbers Mean):',
                    style: bodyStyle,
                  ),
                ),
                Text(
                  '1. OD “oculus dexter” indicates your right eye’s parameters.',
                  style: normalStyle,
                ),
                Text(
                  '2. OS “oculus sinister” shows your left eye’s parameters.',
                  style: normalStyle,
                ),
                Text(
                  '3. Sphere indicates the amount of lens power prescribed for nearsighted or farsighted vision. It is measured in diopter. ',
                  style: normalStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: hw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '(+) for farsightedness (hyperopia)',
                          style: bodyStyle,
                        ),
                        Text(
                          '(-) for nearsightedness (myopia).',
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  '4. CYL & AXIS: Cylinder (CYL) and Axis number (between 0 and 180 degrees) are required to correct Astigmatism. Both parameters will be required together.',
                  style: normalStyle,
                ),
                Text(
                  '5. ADD: provides magnifying power for reading, bifocal, multifocal and progressive lenses. You will most likely have the same number for both eyes that usually ranges between +0.75 and +3.00. Occasionally, lower add powers than +0.75 can be found on a prescription. ',
                  style: normalStyle,
                ),
                Text(
                  '6. PS: It is required when eye ailment needs assistance.',
                  style: normalStyle,
                ),
                SizedBox(
                  height: hp * 0.05,
                ),
                Image.asset('assets/images/eye_glass_chart.png')
              ],
            ),
          ),
        ));
  }
}
