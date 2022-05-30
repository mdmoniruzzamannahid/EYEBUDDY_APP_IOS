import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AcctCharttoF {
  static saveToDatabase(aCollection, uid) async {
    var date = DateTime.now().toString().split(" ")[0].toString();
    SharedPreferences.getInstance().then((value) {
      //value.remove('aBTDate');
      String dValue = value.getString(aCollection);
      if (dValue != null) {
        print(dValue);
        if (dValue == date) {
          print("+++++++++++++++++++++ Already Saved");
        } else {
          saveDataToFireStore(aCollection, uid, date);
          print(date);
          print("+++++++++++++++++++++ Saved");
        }
        print("+++++++++++++++++++++ Not Null");
      } else {
        print("+++++++++++++++++++++Null");
        saveDataToFireStore(aCollection, uid, date);
      }
    });
  }

  static saveDataToFireStore(aCollection, uid, date) {
    FirebaseFirestore.instance
        .collection(aCollection)
        .doc(uid)
        .get()
        .then((value) {
      if (value.data() == null) {
        FirebaseFirestore.instance.collection(aCollection).doc(uid).set({
          "dateTime": FieldValue.arrayUnion([DateTime.now()])
        }).then((value) {
          SharedPreferences.getInstance().then((value) {
            value.setString(aCollection, date);
          });
        });
      } else {
        print(DateTime.now());

        FirebaseFirestore.instance.collection(aCollection).doc(uid).update({
          "dateTime": FieldValue.arrayUnion([DateTime.now()])
        }).then((value) {
          SharedPreferences.getInstance().then((value) {
            value.setString(aCollection, date);
          });
        });
      }
    });
  }
}
