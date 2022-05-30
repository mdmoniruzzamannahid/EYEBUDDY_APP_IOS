import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';

import 'package:eye_buddy/screen/homepage/eye_test/eye_test.dart';
import 'package:eye_buddy/screen/homepage/vibrationhomepage.dart';
import 'package:eye_buddy/screen/instruction/Instruction22.dart';
import 'package:eye_buddy/screen/pricing/pricing_page.dart';
import 'package:eye_buddy/screen/training_regime/training_regime.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    // TODO: implement initState

    // SharedPreferences.getInstance().then((value) {
    //   value..remove('daInstaShowValue');
    // });

    // print('aasdasdsadsadsadasdasd');
    var provider = Provider.of<ProviderModel>(context, listen: false);
    // provider.initialize();

    print(provider.myPurchasedProduct.toString());

    // CFT
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        FirebaseFirestore.instance
            .collection("PurchaseInfo")
            .doc(user.uid)
            .get()
            .then((value) {
          if (value != null) {
            print(value.data()["purchasePackage"]);
            provider.myPurchasedProductSet = value.data()["purchasePackage"];
            provider.myPurchasedProductStatus = value.data()["purchaseStatus"];
            provider.myPurchasedProductExDate =
                value.data()["purchaseExDate"].toDate();
            //print(DateTime.now().isBefore(purchaseExDate));

          }
        });
      }
    });
//CFT

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      // onWillPop: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Home()));
      // },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                      height: 185.92,
                      width: 259.11,
                      child: Image.asset("assets/images/eye_man.png")),
                ),
                SizedBox(
                  height: hp * 0.07,
                ),
                MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllExcercies()),
                    );
                  },
                  child: Text(
                    'Eye Exercise',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex('#FEC62D'),
                ),
                SizedBox(
                  height: hp * 0.03,
                ),
                MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrainingRegime()),
                    );
                  },
                  child: Text(
                    'Training Regime',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex('#FEC62D'),
                ),
                SizedBox(
                  height: hp * 0.03,
                ),
                MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EyeTest()),
                    );
                  },
                  child: Text(
                    'Eye Test',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex('#FEC62D'),
                ),
                SizedBox(
                  height: hp * 0.03,
                ),
                // MaterialButton(
                //   height: hp * 0.07,
                //   minWidth: hw * 0.8,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => VibrateHomepage()),
                //     );
                //   },
                //   child: Text(
                //     'VIBRATION',
                //     style: TextStyle(
                //         fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                //   ),
                //   color: colorFromHex('#FEC62D'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
