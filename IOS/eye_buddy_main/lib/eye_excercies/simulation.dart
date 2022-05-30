import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';

import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SimulationEye extends StatefulWidget {
  @override
  _SimulationEyeState createState() => _SimulationEyeState();
}

class _SimulationEyeState extends State<SimulationEye> {
  String exName = "Simulation";

  int id;
  bool paid = false;
  @override
  void initState() {
    // TODO: implement initState
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    var provider = Provider.of<ProviderModel>(context);

    // if ((provider.isPurchased == true) ||
    //     (provider.productID == 'free_trial_with_yearly_subscription_premium')) {
    //   paid = true;
    // } else {
    //   paid = false;
    // }
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
            'STIMULATION',
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
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 29, exName: exName, slide: 2))),
                    child: patternFocus(hp, hw, paid),
                  ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: eyeExcerciesFiles[0].id,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[0].slide,
                  //               ))),
                  //   child: splitimages(hp, hw,true),
                  // ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: eyeExcerciesFiles[0].id,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[0].slide,
                  //               ))),
                  //   child: focusshift(hp, hw,true),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[7].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[7].slide,
                                    ))),
                    child: yinYangFlicker(hp, hw, paid),
                  ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: eyeExcerciesFiles[11].id,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[11].slide,
                  //               ))),
                  //   child: waveMove(hp, hw,true),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[1].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[1].slide,
                                    ))),
                    child: colorPath(hp, hw, paid),
                  ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: eyeExcerciesFiles[33].id,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[33].slide,
                  //               ))),
                  //   child: circleFocus(hp, hw,true),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[31].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[31].slide,
                                    ))),
                    child: leftRightMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[12].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[12].slide,
                                    ))),
                    child: lightFlare(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[10].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[10].slide,
                                    ))),
                    child: flashingShapes(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[5].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[5].slide,
                                    ))),
                    child: colorStripes(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[6].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[6].slide,
                                    ))),
                    child: trafficLigths(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
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
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[29].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[29].slide,
                                    ))),
                    child: lightFlicker(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('sm')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: eyeExcerciesFiles[39].id,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[39].slide,
                                    ))),
                    child: kaleidoscope(hp, hw, paid),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
