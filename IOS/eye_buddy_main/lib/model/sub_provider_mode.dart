import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

class ProviderModel with ChangeNotifier {
  // InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  final InAppPurchase _iap = InAppPurchase.instance;

  bool available = true;
  // ignore: cancel_subscriptions
  StreamSubscription subscription;

  String _myProductID = "";
  String get productID => _myProductID;
  set productID(String proId) {
    _myProductID = proId;
    notifyListeners();
  }

  bool _isPurchased = false;
  bool get isPurchased => _isPurchased;
  set isPurchased(bool value) {
    print('This is isPerches $value');
    _isPurchased = value;
    notifyListeners();
  }

  List _purchases = [];
  List get purchases => _purchases;
  set purchases(List value) {
    _purchases = value;
    notifyListeners();
  }

  List _products = [];
  List get products => _products;
  set products(List value) {
    _products = value;
    notifyListeners();
  }

  void initialize() async {
    available = await _iap.isAvailable();
    if (available) {
      await _getProducts();
      await _getPastPurchases();
      verifyPurchase();

      //  subscription = _iap.purchaseUpdatedStream.listen((data) {
      subscription = _iap.purchaseStream.listen((data) {
        purchases.addAll(data);
        verifyPurchase();
      });
    }
  }

  void verifyPurchase() {
    PurchaseDetails purchase = hasPurchased(_myProductID);

    if (purchase != null && purchase.status == PurchaseStatus.purchased) {
      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);

        if (purchase != null && purchase.status == PurchaseStatus.purchased) {
          isPurchased = true;
        }
      }
    }
  }

  PurchaseDetails hasPurchased(String productID) {
    return purchases.firstWhere((purchase) => purchase.productID == productID,
        orElse: () => null);
  }

  Future<void> _getProducts() async {
    Set<String> ids = Set.from([_myProductID]);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    products = response.productDetails;
  }

  Future<void> _getPastPurchases() async {
    // QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases();
    // for (PurchaseDetails purchase in response.pastPurchases) {
    //   if (Platform.isIOS) {
    //     _iap.consumePurchase(purchase);
    //   }
    // }
    // purchases = response.pastPurchases;
  }

  String _myPurchasedProduct = "";
  String get myPurchasedProduct => _myPurchasedProduct;
  set myPurchasedProductSet(String myPurchasedProductName) {
    _myPurchasedProduct = myPurchasedProductName;
    notifyListeners();
  }

  DateTime _myPurchasedProductExDate;
  DateTime get myPurchasedProductExDate => _myPurchasedProductExDate;
  set myPurchasedProductExDate(DateTime myPurchasedProductExDateValue) {
    _myPurchasedProductExDate = myPurchasedProductExDateValue;
    notifyListeners();
  }

  String _myPurchasedProductStatus = 'false';
  String get myPurchasedProductStatus => _myPurchasedProductStatus;
  set myPurchasedProductStatus(String myPurchasedProductStatusValue) {
    _myPurchasedProductStatus = myPurchasedProductStatusValue;
    notifyListeners();
  }
}
