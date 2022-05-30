import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';

import 'package:flutter/material.dart';
import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class AccoSpasm extends StatefulWidget {
  String exName = "AccoSpasm";
  // AccoSpasm({this.exName});
  int id;
  int slide;
  @override
  _AccoSpasmState createState() =>
      _AccoSpasmState(id: id, exName: exName, slide: slide);
}

class _AccoSpasmState extends State<AccoSpasm> {
  int id;
  int slide;
  String exName;
  _AccoSpasmState({this.id, this.exName, this.slide});

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
            'ACCOMODATION SPASM',
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
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 1, exName: exName, slide: 3))),
                    child: focusshift(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 3, exName: exName, slide: 3))),
                    child: blurrygabor(hp, hw, paid),
                  ),
                  // InkWell(
                  //   onTap: () => paid == false
                  // ? Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChoosePlan()))
                  // :  Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               Instruction(id: 4, exName: exName, slide: 3))),
                  //   child: gaborblinking(hp, hw,paid),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 9, exName: exName, slide: 2))),
                    child: yinYangFocus(hp, hw, paid),
                  ),
                  // InkWell(
                  //   onTap: () => paid == false
                  // ? Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChoosePlan()))
                  // :  Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               Instruction(id: 8, exName: exName, slide: 3))),
                  //   child: yinYangFlicker(hp, hw,paid),
                  // ),
                  // InkWell(
                  //   onTap: () => paid == false
                  // ? Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChoosePlan()))
                  // :  Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               Instruction(id: 10, exName: exName, slide: 4))),
                  //   child: rollerCoaster(hp, hw,paid),
                  // ),
                  // InkWell(
                  //   onTap: () => paid == false
                  // ? Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChoosePlan()))
                  // :  Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               Instruction(id: 11, exName: exName, slide: 2))),
                  //   child: flashingShapes(hp, hw,paid),
                  // ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 29, exName: exName, slide: 2))),
                    child: patternFocus(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 34, exName: exName, slide: 3))),
                    child: circleFocus(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 38, exName: exName, slide: 3))),
                    child: twoObjects(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 15, exName: exName, slide: 4))),
                    child: jumpingMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 42, exName: exName, slide: 2))),
                    child: convergence(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('as')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                    id: 41, exName: exName, slide: 2))),
                    child: splitimages(hp, hw, paid),
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
