import 'dart:async';
import 'package:eye_buddy/eye_excercies/acco_spasm.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/eye_excercies/custom_excercies.dart';
import 'package:eye_buddy/eye_excercies/dry_eyes.dart';
import 'package:eye_buddy/eye_excercies/eye_muscles.dart';
import 'package:eye_buddy/eye_excercies/lazy_eye.dart';
import 'package:eye_buddy/eye_excercies/relaxation.dart';
import 'package:eye_buddy/eye_excercies/simulation.dart';
import 'package:eye_buddy/screen/homepage/eye_test/eye_test.dart';
import 'package:eye_buddy/screen/signin/login.dart';
import 'package:eye_buddy/screen/training_regime/training_regime.dart';
import 'package:flutter/gestures.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:connectivity/connectivity.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChoosePlan extends StatefulWidget {
  String navigate;
  ChoosePlan(this.navigate);
  @override
  _ChoosePlanState createState() => _ChoosePlanState(navigate);
}

class _ChoosePlanState extends State<ChoosePlan> {
  String navigate;
  _ChoosePlanState(this.navigate);
  // InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  final InAppPurchase _iap = InAppPurchase.instance;
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool trial;
  bool isUserLogedIn = false;
  bool buttonClickedLoading = false;

  //int sIndex = 0;
  //int lIndex = 0;

  @override
  void initState() {
    // print(DateTime.now().add(const Duration(days: 10)).toString());
    //print(DateTime.now().isAfter(DateTime.now().add(const Duration(days: 10))));
    // print(DateTime.now().isBefore(DateTime.now().add(const Duration(days: 10))));

    var provider = Provider.of<ProviderModel>(context, listen: false);
    provider.productID = "monthly_subscription_basic_ios";
    provider.initialize();
    provider.verifyPurchase();

    FirebaseAuth.instance.authStateChanges().listen((User user) {
      setState(() {
        user == null ? isUserLogedIn = false : isUserLogedIn = true;
      });
    });

    //----------

    print(provider.isPurchased.toString());
    //-------------

    _iap.purchaseStream.listen((event) {
      print("^^^^^^^^^^^^^^^^");
      event.forEach((element) {
        print("^^^^^^^^^^^^^^ ${element.status}");
        print("^^^^^^^^^^^^^^ ${element.productID}");
        print("^^^^^^^^^^^^^^ ${element.purchaseID}");
        print("^^^^^^^^^^^^^^ ${element.transactionDate}");
        print(
            "^^^^^^^^^^^^^^ ${element.verificationData.serverVerificationData}");

        if (element.status == PurchaseStatus.purchased) {
          //var exDay, exMonth, exYear;
          // DateTime.now().isBefore(DateTime.now().subtract(const Duration(days: 30)));

          DateTime purchaseExDate;

          if (element.productID.split("_")[0] == "monthly") {
            purchaseExDate = DateTime.now().add(const Duration(days: 30));
          }
          if (element.productID.split("_")[0] == "yearly") {
            purchaseExDate = DateTime.now().add(const Duration(days: 365));
          }
          if (element.productID.split("_")[0] == "free") {
            purchaseExDate = DateTime.now().add(const Duration(days: 7));
          }

          print("********** $purchaseExDate");

          if (buttonClickedLoading) {
            FirebaseFirestore.instance
                .collection("PurchaseInfo")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .set({
              'purchasePackage': element.productID,
              'purchaseID': element.purchaseID,
              'purchaseDate': DateTime.now(),
              'purchaseExDate': purchaseExDate,
              'purchaseStatus': 'true'
            }).then((value) {
              provider.myPurchasedProductSet = element.productID;
              provider.myPurchasedProductExDate = purchaseExDate;
              provider.myPurchasedProductStatus = 'true';
              setState(() {
                buttonClickedLoading = false;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllExcercies()));
            });
            // SharedPreferences.getInstance().then((value) {
            //   value.setString("purchase", element.productID);
            // });
          }
        }
        if (element.status == PurchaseStatus.error) {
          buttonClickedLoading = false;
          print(element.error);
        }
      });
    });

    // print("*********************** ${provider.isPurchased}");
    // print("*********************** ${provider.purchases.length}");
    // print("*********************** ${provider.products[0].price}");
    // print(
    //     "*********************** ${provider.hasPurchased("monthly_subscription_premium")}");
    // _iap.purchaseStream.listen((event) {
    //   print("*********************** ${event.length}");
    // });

    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    buttonClickedLoading = false;
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('===================  Connection ${e.toString()}');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  void _buyProduct(ProductDetails prod) {
    if (isUserLogedIn) {
      setState(() {
        buttonClickedLoading = true;
      });
      try {
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: prod);
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
      } catch (e) {
        setState(() {
          buttonClickedLoading = false;
        });
        print(e);
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  int _pkg = 0;
  int _bundle = 0;
  @override
  Widget build(BuildContext context) {
    print('This is Navigate $navigate');
    var provider = Provider.of<ProviderModel>(context);
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset('assets/icon/back_arrow.png'),
          onTap: () {
            navigate == 'tr'
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrainingRegime()))
                : navigate == 'de'
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DryEyes()))
                    : navigate == 'as'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccoSpasm()))
                        : navigate == 'rl'
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Relaxation()))
                            : navigate == 'em'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EyeMuscles()))
                                : navigate == 'sm'
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SimulationEye()))
                                    : navigate == 'le'
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LazyEye()))
                                        : navigate == 'cs'
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomExcercies()))
                                            : navigate == 'et'
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EyeTest()))
                                                : navigate == 'de'
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    DryEyes()))
                                                    : navigate == 'es'
                                                        ? Navigator.pop(
                                                            context,
                                                          )
                                                        : null;
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'PACKAGE',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () async {
          Navigator.pop(context);
        },
        child: _connectionStatus == 'ConnectivityResult.none'
            ? Center(
                child: Lottie.asset(
                'assets/json/no_internet.json',
              ))
            : provider.products.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(children: [
                          Text(
                            "Unlock Your best Eye Workout",
                            style: TextStyle(fontSize: hw * 0.09),
                          ),
                          SizedBox(
                            height: hw * 0.02,
                          ),
                          MaterialButton(
                            height: hp * 0.07,
                            minWidth: hw - 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {
                              provider.productID =
                                  "free_trial_with_monthly_subscription_premium_ios";
                              provider.initialize();
                              setState(() {
                                _bundle = 0;
                                _pkg = 2;
                                trial = true;
                              });

                              // print('--------------${provider.productID}');

                              //for (var prod in provider.products) _buyProduct(prod);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Start 6 days free trial',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(Icons.arrow_right_alt)
                                ],
                              ),
                            ),
                            color: colorFromHex('#FEC62D'),
                          ),
                          // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FlutterToggleTab(
                              isScroll: false,
                              // width in percent, to set full width just set to 100
                              width: 50,
                              borderRadius: 30,
                              height: 50,
                              selectedIndex: _bundle,
                              selectedBackgroundColors: [ColorConfig.yeallow],
                              unSelectedBackgroundColors: [
                                colorFromHex('#FFFFFF')
                              ],
                              selectedTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              unSelectedTextStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              labels: ["Monthly", "Yearly"],
                              selectedLabelIndex: (bundle) {
                                _bundle = bundle;
                                // sIndex = bundle;

                                print(_pkg);

                                if (_bundle == 0) {
                                  _pkg == 0
                                      ? provider.productID =
                                          "monthly_subscription_basic_ios"
                                      : _pkg == 1
                                          ? provider.productID =
                                              "monthly_subscription_standard_ios"
                                          : provider.productID =
                                              "monthly_subscription_premium_ios";
                                }
                                if (_bundle == 1) {
                                  _pkg == 0
                                      ? provider.productID =
                                          "yearly_subscription_basic_ios"
                                      : _pkg == 1
                                          ? provider.productID =
                                              "yearly_subscription_standard_ios"
                                          : provider.productID =
                                              "yearly_subscription_premium_ios";
                                }

                                provider.initialize();
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20),
                            child: FlutterToggleTab(
                              // width in percent, to set full width just set to 100
                              isScroll: false,
                              width: 80,
                              borderRadius: 30,
                              height: 50,
                              selectedIndex: _pkg,
                              selectedBackgroundColors: [ColorConfig.yeallow],
                              unSelectedBackgroundColors: [ColorConfig.black],
                              selectedTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                              unSelectedTextStyle: TextStyle(
                                  color: ColorConfig.yeallow,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              labels: ["Basic", "Standard", "Premium"],
                              selectedLabelIndex: (pkg) {
                                _pkg = pkg;
                                trial = false;
                                // provider.products = [];
                                if (_bundle == 0) {
                                  _pkg == 0
                                      ? provider.productID =
                                          "monthly_subscription_basic_ios"
                                      : _pkg == 1
                                          ? provider.productID =
                                              "monthly_subscription_standard_ios"
                                          : provider.productID =
                                              "monthly_subscription_premium_ios";
                                }
                                if (_bundle == 1) {
                                  _pkg == 0
                                      ? provider.productID =
                                          "yearly_subscription_basic_ios"
                                      : _pkg == 1
                                          ? provider.productID =
                                              "yearly_subscription_standard_ios"
                                          : provider.productID =
                                              "yearly_subscription_premium_ios";
                                }

                                provider.initialize();
                                print(provider.productID);
                                print(provider.products[0].price);
                                //print(provider.purchases[0].productID);
                              },
                            ),
                          ),

                          _pkg == 0
                              ? _pkg1(provider.products[0].price, hw, _bundle)
                              : _pkg == 1
                                  ? _pkg2(
                                      provider.products[0].price, hw, _bundle)
                                  : _pkg3(
                                      provider.products[0].price, hw, _bundle)
                        ]),
                      ),
                      for (var prod in provider.products)
                        if (provider.hasPurchased(prod.id) != null) ...[
                          Center(
                            child: FittedBox(
                              child: Text(
                                'PURCHASED',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: hw * 0.09, color: Colors.black),
                              ),
                            ),
                          ),
                        ] else ...[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35.0, right: 35),
                            child: MaterialButton(
                              height: hp * 0.07,
                              minWidth: hw - 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: () {
                                !buttonClickedLoading
                                    ? _buyProduct(prod)
                                    : null;
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 35.0, right: 35),
                                child: buttonClickedLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white)
                                    : Text(
                                        'CONTINUE',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                              ),
                              color: colorFromHex('#181D3D'),
                            ),
                          ),
                        ],
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 20, top: 20),
                          child: Text(
                            'Regular Billing, free to cancel anytime.',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, bottom: 20),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      text:
                                          "If you choose to continue, you agree to our "),
                                  TextSpan(
                                      style: TextStyle(color: Colors.blue),
                                      text: " privacy policy ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          var url =
                                              "https://eyebuddy.app/privacy-policy.html";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                  TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      text: "and to our "),
                                  TextSpan(
                                      style: TextStyle(color: Colors.blue),
                                      text: "terms and conditions.",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          var url =
                                              "https://eyebuddy.app/terms-conditions-.html";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                ]))
                            // Text(
                            //   'If you choose to continue, you agree to our privacy policy and to our terms and conditions.',
                            //   textAlign: TextAlign.center,
                            // ),
                            ),
                      ),
                    ],
                  ),
      ),
    );
  }

  _service(String txt, bool state) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(txt),
          state == true
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Icon(
                  Icons.lock,
                  color: Colors.red,
                )
        ],
      ),
    );
  }

  Widget _pkg1(
    price,
    hw,
    _bundle,
  ) {
    print("I am hare ////////////////");
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _bundle == 1
                    ? Text(
                        '27% Off',
                        style: TextStyle(color: ColorConfig.yeallow),
                      )
                    : Text("")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Basic',
                  style: TextStyle(
                      fontSize: hw * 0.07, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  // _bundle == 0 ? price : "\$87.18",
                  // _bundle == 0 ? '9\.99' : "\$87.18",
                  style: TextStyle(
                    fontSize: hw * 0.07,
                  ),
                )
              ],
            ),
          ),
          _service("Day exercise", true),
          _service("Night exercise", true),
          _service("Eye Test", true),
          _service("Relaxation", true),
          _service("Stimulation", true),
          _service("Eye Muscles", false),
          _service("Dry Eye", false),
          _service("Accom spasm", false),
          _service("Lazy Eye", false),
        ],
      ),
    );
  }

  _pkg2(price, hw, _bundle) {
    print("I am hare2 2222222");
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _bundle == 1
                    ? Text(
                        '17% Off',
                        style: TextStyle(color: ColorConfig.yeallow),
                      )
                    : Text("")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Standard",
                  style: TextStyle(
                      fontSize: hw * 0.07, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  // _bundle == 0 ? price : '\$175.13',
                  // _bundle == 0 ? '\$19.99' : '\$175.13',
                  style: TextStyle(
                    fontSize: hw * 0.07,
                  ),
                )
              ],
            ),
          ),
          _service("Day exercise", true),
          _service("Night exercise", true),
          _service("Eye Test", true),
          _service("Relaxation", true),
          _service("Stimulation", true),
          _service("Eye Muscles", true),
          _service("Dry Eye", false),
          _service("Accom spasm", false),
          _service("Lazy Eye", false),
        ],
      ),
    );
  }

  _pkg3(price, hw, _bundle) {
    print("I am hare3 3 3 3");
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _bundle == 1
                    ? Text(
                        '17% Off',
                        style: TextStyle(color: ColorConfig.yeallow),
                      )
                    : Text("")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trial ? "Free Trial" : "Premium",
                  style: TextStyle(
                      fontSize: hw * 0.07, fontWeight: FontWeight.bold),
                ),
                Text(
                  trial ? "0.0" : price,
                  // _bundle == 0 ? price : '\$262.76',
                  style: TextStyle(
                    fontSize: hw * 0.07,
                  ),
                )
              ],
            ),
          ),
          _service("Day exercise", true),
          _service("Night exercise", true),
          _service("Eye Test", true),
          _service("Relaxation", true),
          _service("Stimulation", true),
          _service("Eye Muscles", true),
          _service("Dry Eye", true),
          _service("Accom spasm", true),
          _service("Lazy Eye", true),
        ],
      ),
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  // _pkg4(price, hw) {
  //   print("I am hare3 3 3 3");
  //   return Container(
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "Free Trial",
  //                 style: TextStyle(
  //                     fontSize: hw * 0.07, fontWeight: FontWeight.bold),
  //               ),
  //               Text(
  //                 "0.0",
  //                 //price,
  //                 // _bundle == 0 ? price : '\$262.76',
  //                 style: TextStyle(
  //                   fontSize: hw * 0.07,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         _service("Day exercise", true),
  //         _service("Night exercise", true),
  //         _service("Eye Test", true),
  //         _service("Relaxation", true),
  //         _service("Stimulation", true),
  //         _service("Eye Muscles", true),
  //         _service("Dry Eye", true),
  //         _service("Accom spasm", true),
  //         _service("Lazy Eye", true),
  //       ],
  //     ),
  //   );
  // }
}
