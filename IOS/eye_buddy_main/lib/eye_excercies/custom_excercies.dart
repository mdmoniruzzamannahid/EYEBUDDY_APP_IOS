import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomExcercies extends StatefulWidget {
  CustomExcercies({Key key}) : super(key: key);
  @override
  _CustomExcerciesState createState() => _CustomExcerciesState();
}

class _CustomExcerciesState extends State<CustomExcercies> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _value = false;

  int newId = 1;

  List selectedExercises = [];
  int slide = 0;

  bool paid = false;

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        FirebaseFirestore.instance
            .collection("PurchaseInfo")
            .doc(user.uid)
            .get()
            .then((value) {
          if (value != null) {
            String purchasePackageID = value.data()["purchasePackage"];
            String purchaseStatus = value.data()["purchaseStatus"];
            DateTime purchaseExDate = value.data()["purchaseExDate"].toDate();
            //print(DateTime.now().isBefore(purchaseExDate));
            if (DateTime.now().isBefore(purchaseExDate) &&
                purchaseStatus == "true") {
              setState(() {
                paid = true;
              });
            } else {
              setState(() {
                paid = false;
              });
            }
          }
        });
      }
    });
//CFT
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    var provider = Provider.of<ProviderModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CUSTOM EXERCISE',
          style: TextStyle(fontSize: 18, color: colorFromHex('#181D3D')),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (__) => AllExcercies()));
            }),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: hw,
                height: hp * 0.5,
                color: ColorConfig.yeallow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset(
                          'assets/svg/excercies/${eyeExcerciesFiles[newId].logo}.svg'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      eyeExcerciesFiles[newId].title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                      print('this is value $_value');

                      print("I AM Pressed!!!!");

                      !selectedExercises.contains(newId)
                          ? selectedExercises.add(newId)
                          : selectedExercises.remove(newId);
                      // _scaffoldKey.currentState.showSnackBar(SnackBar(
                      //     content: Text(
                      //         "Already Selected, Please Add Another!")));
                      selectedExercises.forEach((element) {
                        print("This is element$element");
                      });
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: !selectedExercises.contains(newId)
                            ? ColorConfig.black
                            : ColorConfig.yeallow,
                      ),
                      shape: BoxShape.circle,
                      color: !selectedExercises.contains(newId)
                          ? Colors.transparent
                          : ColorConfig.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: !selectedExercises.contains(newId)
                          ? Icon(
                              Icons.check,
                              size: 30.0,
                              color: ColorConfig.black,
                            )
                          : Icon(
                              Icons.check,
                              size: 30.0,
                              color: ColorConfig.yeallow,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eyeExcerciesFiles.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: Card(
                      child: cs(eyeExcerciesFiles[i].title,
                          eyeExcerciesFiles[i].logo, hp, hw, paid),
                    ),
                    onTap: () {
                      setState(() {
                        newId = eyeExcerciesFiles[i].id - 1;

                        _value = false;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50.0),
        child: MaterialButton(
          height: 40,
          minWidth: 200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            if (paid == false) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChoosePlan('cs')));
            } else if (_value == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Instruction(
                            id: selectedExercises[0] + 1,
                            exName: "AllDay",
                            selectedExercise: selectedExercises,
                            customEX: 1,
                            numberOfDoneExercises: 0,
                          )));
            } else {
              _scaffoldKey.currentState.showSnackBar(
                  SnackBar(content: Text("Please Select Excercies!")));
            }
          },
          child: Text(
            'Start',
            style: TextStyle(
                fontFamily: 'DemiBold', color: ColorConfig.black, fontSize: 16),
          ),
          color: ColorConfig.yeallow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget cs(String name, String logo, double hp, double hw, bool paid) {
  return Container(
    width: 100,
    child: paid == false
        ? Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset('assets/svg/lock.svg'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 34.75,
                    width: 32.33,
                    child: SvgPicture.asset(
                      'assets/svg/excercies/$logo.svg',
                    ),
                  ),
                  Container(
                    height: 17,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'TTCommons Demibold',
                        fontSize: 9,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 34.75,
                width: 32.33,
                child: SvgPicture.asset(
                  'assets/svg/excercies/$logo.svg',
                ),
              ),
              Container(
                height: 17,
              ),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'TTCommons Demibold',
                    fontSize: 9,
                    color: Colors.black),
              ),
            ],
          ),
  );
}
