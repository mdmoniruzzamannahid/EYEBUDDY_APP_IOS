import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:eye_buddy/screen/training_regime/accommodation_spasm.dart';
import 'package:eye_buddy/screen/training_regime/bedtime_training.dart';
import 'package:eye_buddy/screen/training_regime/dry_eye_treatment.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr.dart';
import 'package:eye_buddy/screen/training_regime/lazy_eye_treatment.dart';
import 'package:eye_buddy/screen/training_regime/sports_vision_therapy.dart';
import 'package:eye_buddy/screen/training_regime/yoga_and_eyes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TrainingRegime extends StatefulWidget {
  @override
  _TrainingRegimeState createState() => _TrainingRegimeState();
}

class _TrainingRegimeState extends State<TrainingRegime> {
  bool basic = false;
  bool standard = false;
  bool premium = false;
  @override
  void initState() {
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
    //             purchaseStatus == "true") {
    //           setState(() {
    //             basic = true;
    //           });
    //         }
    //         if (DateTime.now().isBefore(purchaseExDate) &&
    //             purchaseStatus == "true" &&
    //             (purchasePackageID == "monthly_subscription_premium_ios" ||
    //                 purchasePackageID == "yearly_subscription_premium_ios" ||
    //                 purchasePackageID == "monthly_subscription_standard_ios" ||
    //                 purchasePackageID == "yearly_subscription_standard_ios" ||
    //                 purchasePackageID ==
    //                     "free_trial_with_monthly_subscription_premium_ios")) {
    //           setState(() {
    //             standard = true;
    //           });
    //         }
    //         if (DateTime.now().isBefore(purchaseExDate) &&
    //             purchaseStatus == "true" &&
    //             (purchasePackageID == "monthly_subscription_premium_ios" ||
    //                 purchasePackageID == "yearly_subscription_premium_ios" ||
    //                 purchasePackageID ==
    //                     "free_trial_with_monthly_subscription_premium_ios")) {
    //           setState(() {
    //             premium = true;
    //           });
    //         }
    //       } else {
    //         setState(() {
    //           basic = false;
    //           standard = false;
    //           premium = false;
    //         });
    //       }
    //     });
    //   }
    // });
    var provider = Provider.of<ProviderModel>(context, listen: false);

    String purchasePackageID = provider.myPurchasedProduct;
    String purchaseStatus = provider.myPurchasedProductStatus;
    DateTime purchaseExDate = provider.myPurchasedProductExDate;
    if (purchaseStatus == 'true') {
      if (DateTime.now().isBefore(purchaseExDate) && purchaseStatus == "true") {
        basic = true;
      }
      if (DateTime.now().isBefore(purchaseExDate) &&
          purchaseStatus == "true" &&
          (purchasePackageID == "monthly_subscription_premium_ios" ||
              purchasePackageID == "yearly_subscription_premium_ios" ||
              purchasePackageID == "monthly_subscription_standard_ios" ||
              purchasePackageID == "yearly_subscription_standard_ios" ||
              purchasePackageID ==
                  "free_trial_with_monthly_subscription_premium_ios")) {
        standard = true;
      }
      if (DateTime.now().isBefore(purchaseExDate) &&
          purchaseStatus == "true" &&
          (purchasePackageID == "monthly_subscription_premium_ios" ||
              purchasePackageID == "yearly_subscription_premium_ios" ||
              purchasePackageID ==
                  "free_trial_with_monthly_subscription_premium_ios")) {
        premium = true;
      } else {
        basic = false;
        standard = false;
        premium = false;
      }
    } else {
      basic = false;
      standard = false;
      premium = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    // print("$basic, $standard, $premium");
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    newSelectedIndex: 0,
                  ))),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child: Image.asset('assets/icon/back_arrow.png'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(
                              newSelectedIndex: 0,
                            )));
              }),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'TRAINING REGIME',
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
                    basic != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BedtimeTraining()));
                  },
                  child:
                      _traing_card(h, w, 'bedtime', 'Bedtime Training', basic),
                ),
                InkWell(
                  onTap: () {
                    basic != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Emdr()));
                  },
                  child: _traing_card(h, w, 'emdr', 'EMDR', basic),
                ),
                InkWell(
                  onTap: () {
                    basic != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YogaAndEyes()));
                  },
                  child: _traing_card(h, w, 'yoga', 'Yoga and Eyes', basic),
                ),
                InkWell(
                  onTap: () {
                    standard != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SportVisonTherapy()));
                  },
                  child: _traing_card(
                      h, w, 'sports', 'Sports Vision therapy', standard),
                ),
                InkWell(
                  onTap: () {
                    premium != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DryEyesTreatment()));
                  },
                  child: _traing_card(
                      h, w, 'dry_eye', 'Dry eye treatment plan', premium),
                ),
                InkWell(
                  onTap: () {
                    premium != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LazyEyeTreatment()));
                  },
                  child: _traing_card(
                      h, w, 'lazy_eye', 'Lazy Eye Treatment Plan', premium),
                ),
                InkWell(
                  onTap: () {
                    premium != true || standard != true || premium != true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePlan('tr')))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccommodationSpasm()));
                  },
                  child: _traing_card(h, w, 'accommodation',
                      'Accommodation Spasm treatment plan', premium),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _traing_card(double h, double w, String asset, String name, bool paid) {
    return paid == true
        ? Padding(
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
                            height: h * 0.1,
                            child: SvgPicture.asset(
                                "assets/svg/training_regime/$asset.svg"),
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
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Stack(
              children: [
                Container(
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
                                height: h * 0.1,
                                // width: 50,
                                child: SvgPicture.asset(
                                    "assets/svg/training_regime/$asset.svg"),
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
                Positioned(
                  right: 3,
                  top: 3,
                  child: SvgPicture.asset('assets/svg/lock.svg'),
                ),
              ],
            ),
          );
  }
}
