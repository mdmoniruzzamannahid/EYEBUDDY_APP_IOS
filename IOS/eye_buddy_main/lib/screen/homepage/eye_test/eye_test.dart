import 'package:eye_buddy/model/eye_test_model.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/homepage/eye_test/eye_test_popup.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
// import 'package:eye_buddy/screen/homepage/eye_test/low_vision.dart';
// import 'package:eye_buddy/screen/homepage/eye_test/near_vision_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:provider/provider.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EyeTest extends StatefulWidget {
  @override
  _EyeTestState createState() => _EyeTestState();
}

class _EyeTestState extends State<EyeTest> {
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
          (purchaseStatus == "true")) {
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
    // } else {}
    return Scaffold(
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
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'EYE TEST',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: ListView(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: hw * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Text(
                                        "TEST YOUR",
                                        style: TextStyle(
                                            fontFamily: 'TTCommons',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: colorFromHex('#181D3D')),
                                      ),
                                      Text(
                                        "VISION",
                                        style: TextStyle(
                                          fontFamily: 'TTCommons',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: colorFromHex('#FEC62D'),
                                        ),
                                      ),
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Recognize Signs for early Vision Loss, Detect Potential Eye Diseases and Preserve Your Eye Sight by Testing Your Vision Daily.',
                                    style: TextStyle(
                                        fontFamily: 'TTCommons',
                                        fontSize: 8,
                                        //fontWeight: FontWeight.w600,
                                        color: colorFromHex('#181D3D')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset('assets/images/superboy.png')
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
                          child: Text(
                            'All Tests',
                            style: TextStyle(
                                fontFamily: 'TTCommons',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: colorFromHex('#181D3D')),
                          )),
                    ],
                  ),
                  Container(
                    height: hp * 0.5,
                    width: hw - 46,
                    child: ListView(
                      children: List.generate(
                        testModels.length,
                        (index) {
                          return paid == true
                              ? InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EyeTestPopup(
                                                  testModels[index].id,
                                                  testModels[index].popup,
                                                  testModels[index].slide,
                                                )));
                                  },
                                  child: _test(
                                      hw,
                                      testModels[index].title,
                                      testModels[index].logo,
                                      testModels[index].desc,
                                      paid),
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChoosePlan('et')));
                                  },
                                  child: _test(
                                      hw,
                                      testModels[index].title,
                                      testModels[index].logo,
                                      testModels[index].desc,
                                      paid),
                                );
                        },
                      ),
                    ),
                  ),
                ]),
          ]),
        ),
      ),
    );
  }

  Widget _test(double hw, String name, String logo, String desc, bool paid) {
    return paid == false
        ? Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: colorFromHex('#FFFFFF')),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 112,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Container(
                                    height: 55,
                                    width: 60,
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: SvgPicture.asset(
                                        logo,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10),
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: colorFromHex('#181D3D'),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: hw * 0.5,
                                      child: Text(
                                        desc,
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: colorFromHex('#181D3D'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: colorFromHex('#FEC62D'),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
                          width: hw,
                          height: 38,
                          child: Center(
                            child: Text(
                              'Start Test',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: colorFromHex('#181D3D')),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: SvgPicture.asset('assets/svg/lock.svg'),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: colorFromHex('#FFFFFF')),
                child: Column(
                  children: [
                    Container(
                      height: 112,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                height: 55,
                                width: 60,
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: SvgPicture.asset(
                                    logo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: colorFromHex('#181D3D'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: hw * 0.5,
                                  child: Text(
                                    desc,
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: colorFromHex('#181D3D'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: colorFromHex('#FEC62D'),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                      width: hw,
                      height: 38,
                      child: Center(
                        child: Text(
                          'Start Test',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorFromHex('#181D3D')),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
