import 'package:eye_buddy/eye_excercies/Instruction.dart';

import 'package:eye_buddy/model/eye_excercies_model.dart';

import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseSet extends StatefulWidget {
  String tr;
  ExerciseSet(this.tr);
  @override
  _ExerciseSetState createState() => _ExerciseSetState(tr);
}

class _ExerciseSetState extends State<ExerciseSet> {
  String tr;

  double hp;

  double hw;

  List<Widget> exSet = [];

  bool ppaid;
  _ExerciseSetState(this.tr);
  int newId = 1;

  List selectedExercises = [];
  int slide = 0;

  String exName = 'ExerciseSet';

  int id;
  bool paid = true;

  @override
  void initState() {
    // TODO: implement initState
    // CFT

    // hp = MediaQuery.of(context).size.height;
    // hw = MediaQuery.of(context).size.width;
    switch (tr) {
      case "bedtime":
        {
          exSet = [
            head_palm_rub(hp, hw, paid),
            lymph_cleanse(hp, hw, paid),
            finger_tapping(hp, hw, paid),
            closedEyeMove(hp, hw, paid),
            plaming(hp, hw, paid),
          ];

          selectedExercises = [
            eyeExcerciesFiles[44].id - 1,
            eyeExcerciesFiles[45].id - 1,
            eyeExcerciesFiles[43].id - 1,
            eyeExcerciesFiles[35].id - 1,
            eyeExcerciesFiles[36].id - 1,
          ];
        }
        break;
      case "yoga":
        {
          exSet = [
            single_nostril(hp, hw, paid),
            three_part_breathing(hp, hw, paid),
            rhythmic_breathing(hp, hw, paid),
            diagonalMove(hp, hw, paid),
            growingPattern(hp, hw, paid),
            plaming(hp, hw, paid),
          ];
          selectedExercises = [
            eyeExcerciesFiles[47].id - 1,
            eyeExcerciesFiles[42].id - 1,
            eyeExcerciesFiles[46].id - 1,
            eyeExcerciesFiles[18].id - 1,
            eyeExcerciesFiles[16].id - 1,
            eyeExcerciesFiles[36].id - 1,
          ];
        }
        break;
      case "sports":
        {
          exSet = [
            trajectoryMove(hp, hw, paid),
            infinityMove(hp, hw, paid),
            springMove(hp, hw, paid),
            flowerMove(hp, hw, paid),
            ractangularMove(hp, hw, paid),
          ];
          selectedExercises = [
            eyeExcerciesFiles[23].id - 1,
            eyeExcerciesFiles[25].id - 1,
            eyeExcerciesFiles[22].id - 1,
            eyeExcerciesFiles[20].id - 1,
            eyeExcerciesFiles[27].id - 1,
          ];
        }
        break;
      case "dryeye":
        {
          exSet = [
            closedEyeMove(hp, hw, paid),
            gaborpatches(hp, hw, paid),
            blinking(hp, hw, paid),
            closingTight(hp, hw, paid),
            plaming(hp, hw, paid),
          ];
          selectedExercises = [
            eyeExcerciesFiles[35].id - 1,
            eyeExcerciesFiles[3].id - 1,
            eyeExcerciesFiles[33].id - 1,
            eyeExcerciesFiles[34].id - 1,
            eyeExcerciesFiles[36].id - 1,
          ];
        }
        break;
      case "lazyeye":
        {
          exSet = [
            closedEyeMove(hp, hw, paid),
            butterflyMove(hp, hw, paid),
            circleFocus(hp, hw, paid),
            flowerMove(hp, hw, paid),
            focusshift(hp, hw, paid),
          ];

          selectedExercises = [
            eyeExcerciesFiles[35].id - 1,
            eyeExcerciesFiles[24].id - 1,
            eyeExcerciesFiles[33].id - 1,
            eyeExcerciesFiles[20].id - 1,
            eyeExcerciesFiles[0].id - 1,
          ];
        }
        break;
      case "accommodation":
        {
          exSet = [
            focusshift(hp, hw, paid),
            jumpingMove(hp, hw, paid),
            circleFocus(hp, hw, paid),
            patternFocus(hp, hw, paid),
            splitimages(hp, hw, paid),
          ];

          selectedExercises = [
            eyeExcerciesFiles[0].id - 1,
            eyeExcerciesFiles[14].id - 1,
            eyeExcerciesFiles[33].id - 1,
            eyeExcerciesFiles[28].id - 1,
            eyeExcerciesFiles[40].id - 1,
          ];
        }
        break;

      default:
    }
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
                purchaseStatus == "true" &&
                (purchasePackageID == "monthly_subscription_premium" ||
                    purchasePackageID == "yearly_subscription_premium" ||
                    purchasePackageID == "free_trial_test")) {
              setState(() {
                paid = true;
                ppaid = true;
              });
            } else {
              setState(() {
                paid = false;
                ppaid = false;
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
    hp = MediaQuery.of(context).size.height;
    hw = MediaQuery.of(context).size.width;

    var provider = Provider.of<ProviderModel>(context);

    // if ((provider.productID == 'monthly_subscription_premium') ||
    //     (provider.productID == 'yearly_subscription_premium') ||
    //     (provider.productID == 'free_trial_with_yearly_subscription_premium')) {
    //   paid = true;
    // } else {
    //   paid = false;
    // }
    return WillPopScope(
      onWillPop: () {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (__) => AllExcercies()));
        // return Future.value(true);
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (__) => AllExcercies()));
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'EXERCISE SET',
            style: TextStyle(
              fontFamily: 'TT Commons DemiBold',
              fontSize: 18,
              color: const Color(0xff181d3d),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: GridView.builder(
                    itemCount: exSet.length.toInt(),
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, key) {
                      print(exSet.length);
                      return exSet[key];
                    })),
            Column(
              children: [
                MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Instruction(
                                  id: selectedExercises[0] + 1,
                                  exName: "TrainingRegime",
                                  selectedExercise: selectedExercises,
                                  customEX: 1,
                                  numberOfDoneExercises: 0,
                                )));
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex('#FEC62D'),
                ),
                SizedBox(
                  height: hp * 0.03,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
