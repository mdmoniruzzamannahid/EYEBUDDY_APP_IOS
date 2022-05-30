import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Relaxation extends StatefulWidget {
  @override
  _RelaxationState createState() => _RelaxationState();
}

class _RelaxationState extends State<Relaxation> {
  String exName = "Relaxation";

  int slide;

  int id;

  bool paid = false;

  @override
  void initState() {
    // CFT
    // FirebaseAuth.instance.authStateChanges().listen((User user) {
    //   if (user != null) {
    //     FirebaseFirestore.instance
    //         .collection("PurchaseInfo")
    //         .doc(user.uid)
    //         .get()
    //         .then((value) {
    //       if (value != null) {
    //         String purchasePackageID = value.data()["purchasePackage"];
    //         String purchaseStatus = value.data()["purchaseStatus"];
    //         DateTime purchaseExDate = value.data()["purchaseExDate"].toDate();
    //         if (DateTime.now().isBefore(purchaseExDate) &&
    //             purchaseStatus == "true") {
    //           setState(() {
    //             paid = true;
    //           });
    //         } else {
    //           setState(() {
    //             paid = false;
    //           });
    //         }
    //       }
    //     });
    //   }
    // });
//CFT

    var provider = Provider.of<ProviderModel>(context, listen: false);

    String purchasePackageID = provider.myPurchasedProduct;
    String purchaseStatus = provider.myPurchasedProductStatus;
    DateTime purchaseExDate = provider.myPurchasedProductExDate;
    //print(DateTime.now().isBefore(purchaseExDate));
    if (purchaseStatus == 'true') {
      if (DateTime.now().isBefore(purchaseExDate) &&
          purchaseStatus == 'true' &&
          purchaseStatus == "true") {
        paid = true;
      } else {
        paid = false;
      }
    } else {
      paid = false;
    }
    // TODO: implement initState

    // SharedPreferences.getInstance().then((value) {
    //   String prefsValue = value.getString("purchase");
    //   if (prefsValue == "monthly_subscription_standard" ||
    //       prefsValue == "monthly_subscription_premium") {
    //     setState(() {
    //       paid = true;
    //     });
    //   } else {
    //     setState(() {
    //       paid = false;
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    //var provider = Provider.of<ProviderModel>(context);

    // provider.initialize();
    // if ((provider.isPurchased == true) ||
    //     (provider.productID == 'free_trial_with_yearly_subscription_premium')) {
    //   paid = true;
    // } else {
    //   paid = false;
    // }
    // print(provider.isPurchased);
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (__) => AllExcercies()));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (__) => AllExcercies()));
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'RELAXATION',
            style: TextStyle(
              fontFamily: 'TT Commons DemiBold',
              fontSize: 18,
              color: const Color(0xff181d3d),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: GridView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[42].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[42].slide,
                                    ))),
                    child: three_part_breathing(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[43].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[43].slide,
                                    ))),
                    child: finger_tapping(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[44].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[44].slide,
                                    ))),
                    child: head_palm_rub(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[45].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[45].slide,
                                    ))),
                    child: lymph_cleanse(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[46].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[46].slide,
                                    ))),
                    child: rhythmic_breathing(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[47].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[47].slide,
                                    ))),
                    child: single_nostril(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('rl')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[16].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[16].slide,
                                    ))),
                    child: growingPattern(hp, hw, paid),
                  ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 36,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[35].slide,
                  //                     ))),
                  //         child: closedEyeMove(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 10,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[9].slide,
                  //                     ))),
                  //         child: rollerCoaster(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 11,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[10].slide,
                  //                     ))),
                  //         child: flashingShapes(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 12,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[11].slide,
                  //                     ))),
                  //         child: waveMove(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 38,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[37].slide,
                  //                     ))),
                  //         child: twoObjects(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 39,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[38].slide,
                  //                     ))),
                  //         child: tibetanEyeChart(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 37,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[36].slide,
                  //                     ))),
                  //         child: plaming(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 15,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[14].slide,
                  //                     ))),
                  //         child: jumpingMove(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 16,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[15].slide,
                  //                     ))),
                  //         child: bouncingBall(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 14,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[13].slide,
                  //                     ))),
                  //         child: crossMove(hp, hw),
                  //       ),
                  //       InkWell(
                  //         onTap: () => Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Instruction(
                  //                       id: 32,
                  //                       exName: exName,
                  //                       slide: eyeExcerciesFiles[31].slide,
                  //                     ))),
                  //         child: leftRightMove(hp, hw),
                  //       ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
