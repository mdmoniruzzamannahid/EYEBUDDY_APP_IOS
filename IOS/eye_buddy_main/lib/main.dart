// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
//   AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView(
//           children: [
//             Lottie.asset(
//               'assets/json/no_internet.json',
//               controller: _controller,
//               onLoaded: (composition) {
//                 // Configure the AnimationController with the duration of the
//                 // Lottie file and start the animation.
//                 _controller
//                   ..duration = composition.duration
//                   ..forward();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:eye_buddy/screen/welcomescreen/animation_screen.dart';
import 'package:provider/provider.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (defaultTargetPlatform == TargetPlatform.android) {
    // For play billing library 2.0 on Android, it is mandatory to call
    // [enablePendingPurchases](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.Builder.html#enablependingpurchases)
    // as part of initializing the app.
    InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
  }

  runApp(ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      child: MaterialApp(
        home: MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final InAppPurchase _iap = InAppPurchase.instance;
  // StreamSubscription<List<PurchaseDetails>> _subscription;
  @override
  void initState() {
    var provider = Provider.of<ProviderModel>(context, listen: false);
    provider.initialize();

    print("******************** ${provider.purchases.length}");

    //   final Stream<List<PurchaseDetails>> purchaseUpdated = _iap.purchaseStream;
    //   _subscription =
    //       purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
    //     _listenToPurchaseUpdated(purchaseDetailsList);
    //   }, onDone: () {
    //     _subscription.cancel();
    //   }, onError: (error) {});
    //   super.initState();
    // }
  }

  @override
  void dispose() {
    var provider = Provider.of<ProviderModel>(context, listen: false);
    //provider.subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eyebuddy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnimatedSplashScreen(
          splash: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'),
          )),
          nextScreen: AnimationScreen(),
          splashTransition: SplashTransition.slideTransition,
        )
        // home: MyHomePage(),
        );
  }
}


// void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//   purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
//     if (purchaseDetails.status == PurchaseStatus.pending) {
//       // showPendingUI();
//       print("*********************** Pending");
//     } else {
//       if (purchaseDetails.status == PurchaseStatus.error) {
//         //handleError(purchaseDetails.error!);
//         print("*********************** error");
//       } else if (purchaseDetails.status == PurchaseStatus.purchased) {
//         print("*********************** Purchased");

//         bool valid = await _verifyPurchase(purchaseDetails);
//         if (valid) {
//           // deliverProduct(purchaseDetails);
//           print("*********************** Yes");
//         } else {
//           print("*********************** Invalid");
//           // _handleInvalidPurchase(purchaseDetails);
//           return;
//         }
//       }
//       // if (Platform.isAndroid) {
//       //   if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
//       //     final InAppPurchaseAndroidPlatformAddition androidAddition =
//       //         _inAppPurchase
//       //             .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
//       //     await androidAddition.consumePurchase(purchaseDetails);
//       //   }
//       // }
//       if (purchaseDetails.pendingCompletePurchase) {
//         await InAppPurchase.instance.completePurchase(purchaseDetails);
//       }
//     }
//   });
// }

// _verifyPurchase(PurchaseDetails purchaseDetails) {
//   return Future<bool>.value(true);
// }
