import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DryEyes extends StatefulWidget {
  @override
  _DryEyesState createState() => _DryEyesState();
}

class _DryEyesState extends State<DryEyes> {
  String exName = 'DryEyes';

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
    //         //print(DateTime.now().isBefore(purchaseExDate));
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

    // CFT

    var provider = Provider.of<ProviderModel>(context, listen: false);

    String purchasePackageID = provider.myPurchasedProduct;
    String purchaseStatus = provider.myPurchasedProductStatus;
    DateTime purchaseExDate = provider.myPurchasedProductExDate;

    print(provider.myPurchasedProductStatus);
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

    print(paid.toString());

//CFT
//CFT

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
            'DRY EYE',
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
                                builder: (context) => ChoosePlan('de')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 36,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[35].slide,
                                    ))),
                    child: closedEyeMove(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('de')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 37,
                                      exName: exName,
                                      slide: 6,
                                    ))),
                    child: plaming(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('de')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 35,
                                      exName: exName,
                                      slide: 2,
                                    ))),
                    child: closingTight(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('de')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 33,
                                      exName: exName,
                                      slide: 2,
                                    ))),
                    child: blinking(hp, hw, paid),
                  ),
                  InkWell(
                    onTap: () => paid == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('de')))
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
                                builder: (context) => ChoosePlan('de')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction(
                                      id: 4,
                                      exName: exName,
                                      slide: eyeExcerciesFiles[3].slide,
                                    ))),
                    child: gaborblinking(hp, hw, paid),
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
