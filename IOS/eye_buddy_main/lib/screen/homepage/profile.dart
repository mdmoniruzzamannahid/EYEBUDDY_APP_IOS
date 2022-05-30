import 'dart:io';
import 'package:eye_buddy/screen/eye_glass_chart.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:async';
import '../homepage/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:eye_buddy/screen/setting_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  var userID;
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

  bool eyeGlassChartDate = false;
  File userPickedImage;
  bool pickedImageV = false;
  String userProfileImage;
  var uname = "loading..";
  List userEyeIssues = [];
  double totalXP = 0.0;
  double januaryXP = 0.0;
  double februaryXP = 0.0;
  double marchXP = 0.0;
  double aprilXP = 0.0;
  double mayXP = 0.0;
  double juneXP = 0.0;
  double julyXP = 0.0;
  double augustXP = 0.0;
  double septemberXP = 0.0;
  double octoberXP = 0.0;
  double novemberXP = 0.0;
  double decemberXP = 0.0;

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
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
              fontSize: 9),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'JAN';
              case 1:
                return 'FEB';
              case 2:
                return 'MAR';
              case 3:
                return 'APR';
              case 4:
                return 'MAY';
              case 5:
                return 'JUN';
              case 6:
                return 'JUL';
              case 7:
                return 'AUG';
              case 8:
                return 'SEP';
              case 9:
                return 'OCT';
              case 10:
                return 'NOV';
              case 11:
                return 'DEC';
            }
            return '';
          },
          margin: 8,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, januaryXP / 1000),
            FlSpot(1, februaryXP / 1000),
            FlSpot(2, marchXP / 1000),
            FlSpot(3, aprilXP / 1000),
            FlSpot(4, mayXP / 1000),
            FlSpot(5, juneXP / 1000),
            FlSpot(6, julyXP / 1000),
            FlSpot(7, augustXP / 1000),
            FlSpot(8, septemberXP / 1000),
            FlSpot(9, octoberXP / 1000),
            FlSpot(10, novemberXP / 1000),
            FlSpot(11, decemberXP / 1000),
          ],
          isCurved: true,
          colors: [ColorConfig.yeallow],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
      ],
    );
  }

  saveName() {
    String editedName = nameController.text.toString();
    FirebaseFirestore.instance
        .collection("UserInfo")
        .doc(userID)
        .update({"userName": editedName}).then((value) {
      FirebaseFirestore.instance
          .collection("UserInfo")
          .doc(userID)
          .get()
          .then((value) {
        setState(() {
          uname = value.data()["userName"];
        });
        Navigator.of(context).pop();
      });
    });
  }

  Future pickedImage() async {
    try {
      XFile pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      // PickedFile pickedFile =
      //     await ImagePicker().getImage(source: ImageSource.gallery);
      setState(() {
        pickedImageV = true;
        userPickedImage = File(pickedFile.path);
        // print("-----------------${userPickedImage.path}");
      });
      uploadImage();
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  _imgFromCamera() async {
    try {
      final XFile image = await _picker.pickImage(source: ImageSource.camera);
      // File image = await ImagePicker.pickImage(
      //     source: ImageSource.camera, imageQuality: 50);

      setState(() {
        pickedImageV = true;
        userPickedImage = File(image.path);
        // print("-----------------${userPickedImage.path}");
      });
      uploadImage();
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
  // _imgFromCamera() async {
  //   // ignore: deprecated_member_use
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.camera, imageQuality: 50);

  //   setState(() {
  //     // _image = image;
  //   });
  // }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        pickedImage();
                        // _imgFromGallery();
                        // Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadImage() async {
    try {
      FirebaseStorage.instance
          .ref()
          .child(
              'userProfileImage/${FirebaseAuth.instance.currentUser.uid.toString()}.jpg')
          .putFile(userPickedImage)
          .then((uimage) async {
        print(
            "---------- profile page user image ${await uimage.ref.getDownloadURL()}");
        // print("----------${FirebaseAuth.instance.currentUser.uid.toString()}");
        FirebaseFirestore.instance
            .collection("UserInfo")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .update({
          "userProfileImage": await uimage.ref.getDownloadURL()
        }).then((value) {
          setState(() {
            userProfileImage = uimage.ref.getDownloadURL().toString();
          });
        });
      });
    } catch (e) {}
  }

  String _mybadge() {
    return totalXP >= 0 && totalXP < 300
        ? '01'
        : totalXP >= 300 && totalXP < 4200
            ? '02'
            : totalXP >= 4200 && totalXP < 9000
                ? '03'
                : totalXP >= 9000 && totalXP < 17000
                    ? '04'
                    : totalXP >= 17000 && totalXP < 29000
                        ? '05'
                        : totalXP >= 29000 && totalXP < 36000
                            ? '06'
                            : totalXP >= 36000 && totalXP < 40400
                                ? '07'
                                : totalXP >= 40400 && totalXP < 54000
                                    ? '08'
                                    : totalXP >= 54000 && totalXP < 69000
                                        ? '09'
                                        : totalXP >= 69000 && totalXP < 1000000
                                            ? 'true bro'
                                            : totalXP >= 1000000
                                                ? 'legend'
                                                : 'legend';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    User user = FirebaseAuth.instance.currentUser;
    userID = user.uid;
    FirebaseFirestore.instance
        .collection("UserInfo")
        .doc(userID)
        .get()
        .then((value) {
      setState(() {
        this.uname = value.data()['userName'];
        print(this.uname);
        userEyeIssues = value.data()['userEyeIssues'];
        userProfileImage = value.data()['userProfileImage'];
        print("----------------------$userEyeIssues");
        // userEyeIssues.forEach((element) {
        //   print(element);
        // });
      });
      print("------------------Username: ${value.data()['userName']}");

      FirebaseFirestore.instance
          .collection("EyeGlassChart")
          .doc(userID)
          .get()
          .then((value) {
        if (value.data().length != 0) {
          oDSphere = value.data()["oDSphere"];
          oDCylindrical = value.data()["oDCylindrical"];
          oDAxis = value.data()["oDAxis"];
          oDPS = value.data()["oDPS"];
          oDADD = value.data()["oDADD"];
          oSSphere = value.data()["oSSphere"];
          oSCylindrical = value.data()["oSCylindrical"];
          oSAxis = value.data()["oSAxis"];
          oSPS = value.data()["oSPS"];
          oSADD = value.data()["oSADD"];

          eyeGlassChartDate = true;

          print("##########################$oDSphere");
        }

        // setState(() {});
      });

      FirebaseFirestore.instance
          .collection("EyeExercisePoint")
          .where("userID", isEqualTo: userID)
          //.where("month", isEqualTo: 2)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(
              "++++++++++++++++++++++++++ Userxp ${element.data()['xpPoint']}");

          print("++++++++++++++++++++++ ${element.data()["month"]}");

          if (element.data()["month"] != null) {
            if (element.data()["month"] == 1) {
              januaryXP = januaryXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 2) {
              februaryXP = februaryXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 3) {
              marchXP = marchXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 4) {
              aprilXP = aprilXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 5) {
              mayXP = mayXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 6) {
              juneXP = juneXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 7) {
              julyXP = julyXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 8) {
              augustXP = augustXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 9) {
              septemberXP = septemberXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 10) {
              octoberXP = octoberXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 11) {
              novemberXP = novemberXP + element.data()["xpPoint"];
            }
            if (element.data()["month"] == 12) {
              decemberXP = decemberXP + element.data()["xpPoint"];
            }
          }
          totalXP = (totalXP + element.data()['xpPoint']);
        });
        print(totalXP);
        print(februaryXP);
        setState(() {});
      });

      // return value;
      // setState(() {
      //   this.userName = value.data()['userName'];
      // });
    });
  }

///////////// Scafflod Option
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
        // onWillPop: () async => false,
        // ignore: missing_return
        onWillPop: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        newSelectedIndex: 0,
                      )));
        },
        child: Scaffold(
            backgroundColor: colorFromHex('#FFFFFF'),
            body: ListView(
              padding: EdgeInsets.only(top: 20, left: 25.6, right: 25.6),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Container(
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(5.00)),
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.more_vert,
                              color: ColorConfig.black,
                              size: 40,
                            ),
                            // decoration: BoxDecoration(
                            //     color: colorFromHex('#181D3D'),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(15))),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage()));
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        color: Colors.black26,
                        height: 257.27,
                        width: 245.11,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: colorFromHex('#FFFFFF'),
                              height: 257.27,
                              width: 245.11,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/svg/profile_bg.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                                height: 257.27,
                                width: 245.11,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () => _showPicker(context),
                                  child: CircleAvatar(
                                    radius: 42,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: userProfileImage == null
                                          ? AssetImage(
                                              'assets/images/blank_profile.png')
                                          : NetworkImage(userProfileImage),
                                    ),
                                    //  child: CircleAvatar(
                                    //   radius: 40,
                                    //   backgroundImage: userProfileImage == null
                                    //       ? AssetImage(
                                    //           'assets/images/blank_profile.png')
                                    //       : pickedImageV
                                    //           ? FileImage(userPickedImage)
                                    //           : NetworkImage(userProfileImage),
                                    // ),
                                  ),
                                )),
                            Positioned(
                              top: 145,
                              right: 90,
                              child: Container(
                                height: 25,
                                width: 25,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: colorFromHex('#FEC62D'),
                                  size: 15,
                                ),
                                decoration: BoxDecoration(
                                    color: colorFromHex('#181D3D'),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 65,
                            child: Card(
                                color: ColorConfig.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    "assets/images/level_logo/${_mybadge()}.svg",
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    uname.replaceAll(RegExp(' '), '_') != null
                                        ? uname
                                            .replaceAll(RegExp(' '), '_')
                                            .split("@")[0]
                                        : "N/A",
                                  ),
                                  LinearPercentIndicator(
                                    width: 150.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 10.0,
                                    percent: totalXP <= 100
                                        ? totalXP / 100
                                        : totalXP <= 300 && totalXP > 100
                                            ? totalXP / 300
                                            : totalXP <= 4200 && totalXP > 300
                                                ? totalXP / 4200
                                                : totalXP <= 9000 &&
                                                        totalXP > 4200
                                                    ? totalXP / 9000
                                                    : totalXP <= 17000 &&
                                                            totalXP > 9000
                                                        ? totalXP / 17000
                                                        : totalXP <= 29000 &&
                                                                totalXP > 17000
                                                            ? totalXP / 29000
                                                            : totalXP <=
                                                                        36000 &&
                                                                    totalXP >
                                                                        29000
                                                                ? totalXP /
                                                                    36000
                                                                : totalXP <=
                                                                            40400 &&
                                                                        totalXP >
                                                                            36000
                                                                    ? totalXP /
                                                                        40400
                                                                    : totalXP <=
                                                                                54000 &&
                                                                            totalXP >
                                                                                40400
                                                                        ? totalXP /
                                                                            54000
                                                                        : totalXP <= 69000 &&
                                                                                totalXP > 54000
                                                                            ? totalXP / 69000
                                                                            : totalXP <= 1000000 && totalXP > 69000
                                                                                ? totalXP / 1000000
                                                                                : 1000000,
                                    linearStrokeCap: LinearStrokeCap.butt,
                                    progressColor: ColorConfig.yeallow,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Stack(
                                              overflow: Overflow.visible,
                                              children: <Widget>[
                                                Positioned(
                                                  right: -40.0,
                                                  top: -40.0,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: CircleAvatar(
                                                      child: Icon(Icons.close),
                                                      backgroundColor:
                                                          ColorConfig.black,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child:
                                                          Text("Change Name"),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller:
                                                            nameController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              uname.replaceAll(
                                                                  RegExp(' '),
                                                                  '_'),
                                                        ),
                                                        enableSuggestions: true,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: MaterialButton(
                                                        color:
                                                            ColorConfig.yeallow,
                                                        child: Text("Save"),
                                                        onPressed: () {
                                                          saveName();
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: SvgPicture.asset(
                                      'assets/svg/name_edit.svg')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            'Eye Issue',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    userEyeIssues == null
                        ? Text("no data")
                        : Container(
                            height: 50,
                            width: hw - 51.2,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: userEyeIssues.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConfig.yeallow,
                                          // Color.fromRGBO(255, 0, 0, 0.0),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          userEyeIssues[index],
                                          style: TextStyle(
                                              color: colorFromHex('#181D3D'),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20),
                      child: Text(
                        'Eye Glass chart',
                        style: TextStyle(
                            color: colorFromHex('#181D3D'),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    Table(
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
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    '${eyeGlassChartDate ? oDSphere : 0} ',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    '${eyeGlassChartDate ? oDCylindrical : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${eyeGlassChartDate ? oDAxis : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${eyeGlassChartDate ? oDPS : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${eyeGlassChartDate ? oDADD : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
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
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    '${eyeGlassChartDate ? oSSphere : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    '${eyeGlassChartDate ? oSCylindrical : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${eyeGlassChartDate ? oSAxis : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${eyeGlassChartDate ? oSPS : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${eyeGlassChartDate ? oSADD : 0}',
                                    style: TextStyle(
                                        fontSize: 9, fontFamily: 'TTCommon')),
                              )
                            ]),
                          ]),
                        ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 36, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            child: Text(
                              'Edit your glass chart?',
                              style: TextStyle(
                                  color: colorFromHex('#FEC733'),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EyeGlassChart(
                                          userID: userID,
                                          oDSphereC: oDSphere,
                                          oDCylindricalC: oDCylindrical,
                                          oDAxisC: oDAxis,
                                          oDPSC: oDPS,
                                          oDADDC: oDADD,
                                          oSSphereC: oSSphere,
                                          oSCylindricalC: oSCylindrical,
                                          oSAxisC: oSAxis,
                                          oSPSC: oSPS,
                                          oSADDC: oSADD,
                                          eyeGlassChartDate:
                                              eyeGlassChartDate)));
                            },
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.70,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                                color: Color(0xffFFFFFF)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 18.0, left: 12.0, top: 24, bottom: 12),
                              child: LineChart(
                                mainData(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Milestones Achived',
                        style: TextStyle(
                            color: colorFromHex('#181D3D'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _milestone(
                              'Contender',
                              totalXP >= 100
                                  ? Colors.transparent
                                  : Colors.black54,
                              "01",
                              hw),
                          SvgPicture.asset('assets/images/rightway.svg'),
                          _milestone(
                              'Shinning Warrior',
                              totalXP >= 300
                                  ? Colors.transparent
                                  : Colors.black54,
                              "02",
                              hw),
                          SvgPicture.asset('assets/images/rightway.svg'),
                          _milestone(
                              'Annihilator',
                              totalXP >= 4200
                                  ? Colors.transparent
                                  : Colors.black54,
                              "03",
                              hw),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 85,
                          child: Center(
                              child: SvgPicture.asset(
                                  'assets/images/downway.svg')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _milestone(
                              "Ravager",
                              totalXP >= 9000
                                  ? Colors.transparent
                                  : Colors.black54,
                              "06",
                              hw),
                          SvgPicture.asset('assets/images/leftway.svg'),
                          _milestone(
                              'Seasoned champion',
                              totalXP >= 17000
                                  ? Colors.transparent
                                  : Colors.black54,
                              "05",
                              hw),
                          SvgPicture.asset('assets/images/leftway.svg'),
                          _milestone(
                              'Worthy',
                              totalXP >= 29000
                                  ? Colors.transparent
                                  : Colors.black54,
                              "04",
                              hw),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 85,
                          child: Center(
                              child: SvgPicture.asset(
                                  'assets/images/downway.svg')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _milestone(
                              'The Champion',
                              totalXP >= 36000
                                  ? Colors.transparent
                                  : Colors.black54,
                              "07",
                              hw),
                          SvgPicture.asset('assets/images/rightway.svg'),
                          _milestone(
                              'Platinum Eye',
                              totalXP >= 40400
                                  ? Colors.transparent
                                  : Colors.black54,
                              "08",
                              hw),
                          SvgPicture.asset('assets/images/rightway.svg'),
                          _milestone(
                              'Heavy Weight',
                              totalXP >= 54000
                                  ? Colors.transparent
                                  : Colors.black54,
                              "09",
                              hw),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 85,
                          child: Center(
                              child: SvgPicture.asset(
                                  'assets/images/downway.svg')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                        ),
                        _milestone(
                            'Legend',
                            totalXP >= 69000
                                ? Colors.transparent
                                : Colors.black54,
                            "legend",
                            hw),
                        SvgPicture.asset('assets/images/leftway.svg'),
                        _milestone(
                            'Ture Bro',
                            totalXP >= 100000
                                ? Colors.transparent
                                : Colors.black54,
                            "true bro",
                            hw),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    )
                  ],
                ),
              ],
            )));
  }
}

Widget _milestone(name, color, logo, hw) {
  return Container(
    height: 68,
    // width: hw * 0.2,
    width: hw * 0.23,
    foregroundDecoration: BoxDecoration(color: color),
    decoration: BoxDecoration(
        color: colorFromHex('#181D3D'),
        border: Border.all(
          width: 5,
          color: colorFromHex('#FEC62D'),
        ),
        // Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: BorderRadius.circular(5)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorFromHex('#FEC62D'),
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 30.88,
          width: 50.05,
          child: SvgPicture.asset(
            'assets/images/level_logo/$logo.svg',
          ),
        ),
      ],
    ),
  );
}
