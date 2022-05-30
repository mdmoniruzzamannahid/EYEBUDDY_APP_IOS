import 'package:eye_buddy/screen/signin/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eye_buddy/screen/signup/gender.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  //++++++++++++++++++++Backend Code++++++++++++++++++++++++++

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String uemail;

  String uid;

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController cPasswordController = TextEditingController();

  var userName;

  var email;

  var password;

  var cPassword;

  var fPassword;

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    //++++++++++++++++++++Backend Code++++++++++++++++++++++++++

    setData() async {
      userName = userNameController.text;
      email = emailController.text;
      password = passwordController.text;
      cPassword = cPasswordController.text;
      if (password == cPassword) {
        fPassword = password;
      }
      print("${this.userName}");
      print("${this.email}");
      print("${this.fPassword}");
      // setState(() {
      //   userName = userNameController.text;
      //   email = emailController.text;
      //   password = passwordController.text;
      //   cPassword = cPasswordController.text;
      //   if (password == cPassword) {
      //     fPassword = password;
      //   }
      //   print("${this.userName}");
      //   print("${this.email}");
      //   print("${this.fPassword}");
      // });

      if (userName.isEmpty) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Please Enter Your Name!"),
        ));
      } else if (!email.contains("@") ||
          !email.contains(".") ||
          email.isEmpty) {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text("Please Enter a Valid Email!")));
      } else if (password.isEmpty || cPassword.isEmpty) {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text("Please Enter Your Password!")));
      } else if (password != cPassword) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Password Mismatch!"),
        ));
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email, password: fPassword);
          print(userCredential.user.email);
          if (userCredential != null) {
            this.uemail = userCredential.user.email;
            this.uid = userCredential.user.uid;

            FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
            firebaseFirestore.collection("UserInfo").doc(uid).set({
              'userName': userName,
              'userProfileImage': "",
              'userXpPoint': 0
            }).then((value) {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Profile(uemail: userName, uid: uid)));
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GenderPage()));
              userNameController.clear();
              emailController.clear();
              passwordController.clear();
              cPasswordController.clear();
            }).catchError((error) {
              print("Error Occured!");
              _scaffoldKey.currentState
                  .showSnackBar(SnackBar(content: Text("Error Occured!")));
            });
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text("The password provided is too weak!")));
          } else if (e.code == 'email-already-in-use') {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Email already exist"),
            ));

            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
    }
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    TextStyle style = TextStyle(
        fontFamily: 'TT Commons', fontSize: 14.0, color: Colors.yellow);
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: hp * 0.03,
              ),
              Text(
                'Sign up',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: hp * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: userNameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    // contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
              SizedBox(
                height: hp * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    // contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
              SizedBox(
                height: hp * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: passwordController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    // contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
              SizedBox(
                height: hp * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: cPasswordController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    // contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
              SizedBox(
                height: hp * 0.03,
              ),
              MaterialButton(
                height: hp * 0.07,
                minWidth: hw * 0.7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.00),
                ),
                // onPressed: () async {
                //   await Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => GenderPage()));
                // },
                onPressed: () {
                  setData();
                },
                child: Text(
                  'Registration',
                  style: TextStyle(
                      fontFamily: 'DemiBold', color: _colorFromHex('#FFFFFF')),
                ),
                color: _colorFromHex('#FEC62D'),
              ),
              SizedBox(
                height: hp * 0.05,
              ),
              Container(
                child: Image.asset("assets/images/shakehand.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Have Account?",
                        style: TextStyle(
                            fontFamily: 'DemiBold',
                            color: _colorFromHex('#000000')),
                      ),
                    ),
                    InkWell(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontFamily: 'DemiBold',
                              color: _colorFromHex('#FEC62D')),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
