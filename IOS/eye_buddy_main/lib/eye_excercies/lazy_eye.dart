import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/eye_excercies/excercies_page.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LazyEye extends StatefulWidget {
  @override
  _LazyEyeState createState() => _LazyEyeState();
}

class _LazyEyeState extends State<LazyEye> {
  String exName = "LazyEye";

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
    //             purchaseStatus == "true" &&
    //             (purchasePackageID == "monthly_subscription_premium_ios" ||
    //                 purchasePackageID == "yearly_subscription_premium_ios" ||
    //                 purchasePackageID ==
    //                     "free_trial_with_monthly_subscription_premium_ios")) {
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
          (purchasePackageID == "monthly_subscription_premium_ios" ||
              purchasePackageID == "yearly_subscription_premium_ios" ||
              purchasePackageID ==
                  "free_trial_with_monthly_subscription_premium_ios")) {
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

    // if ((provider.productID == 'monthly_subscription_premium') ||
    //     (provider.productID == 'yearly_subscription_premium') ||
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
            'Lazy Eye',
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
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: 1,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[0].slide,
                  //               ))),
                  //   child: splitimages(hp, hw,true),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 1,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[0].slide,
                                    ))),
                    child: focusshift(hp, hw, paid),
                  ),
                  // InkWell(
                  //   onTap: () => paid == false
                  // ? Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChoosePlan('le')))
                  // : Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: 2,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[1].slide,
                  //               ))),
                  //   child: convergence(hp, hw,paid),
                  // ),
                  // InkWell(
                  //   onTap: () => paid == false
                  // ? Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChoosePlan('le')))
                  // : Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Instruction(
                  //                 id: 2,
                  //                 exName: exName,
                  //                 slide: eyeExcerciesFiles[1].slide,
                  //               ))),
                  //   child: colorPath(hp, hw,paid),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 19,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[18].slide,
                                    ))),
                    child: diagonalMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 20,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[19].slide,
                                    ))),
                    child: ellipsisMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 15,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[14].slide,
                                    ))),
                    child: jumpingMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 14,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[13].slide,
                                    ))),
                    child: crossMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 12,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[11].slide,
                                    ))),
                    child: waveMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 22,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[21].slide,
                                    ))),
                    child: spiralMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 21,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[20].slide,
                                    ))),
                    child: flowerMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 23,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[22].slide,
                                    ))),
                    child: springMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 24,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[23].slide,
                                    ))),
                    child: trajectoryMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 26,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[25].slide,
                                    ))),
                    child: infinityMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 25,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[24].slide,
                                    ))),
                    child: butterflyMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 34,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[33].slide,
                                    ))),
                    child: circleFocus(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 28,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[27].slide,
                                    ))),
                    child: ractangularMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 10,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[9].slide,
                                    ))),
                    child: rollerCoaster(hp, hw, paid),
                  ),

                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('le')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 32,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[31].slide,
                                    ))),
                    child: leftRightMove(hp, hw, paid),
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
