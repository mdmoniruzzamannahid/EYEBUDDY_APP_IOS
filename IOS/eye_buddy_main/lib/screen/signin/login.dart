import 'package:eye_buddy/screen/homepage/profile.dart';
import 'package:eye_buddy/screen/reset_password/reset_password.dart';
import 'package:eye_buddy/screen/signup/gender.dart';
import 'package:eye_buddy/screen/signup/signup.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:eye_buddy/util/const_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../homepage/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  //+++++++++++++++++++++++ BackEnd Code +++++++++++++++++++++++++++++
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> _userData;
  //AccessToken _accessToken;
  bool _checking = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String email;

  String passsword;

  String uemail;

  String uid;

  bool errorPassword = false;

  bool errorEmail = false;

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Future signInWithGoogle() async {
    print("]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly'
    ], hostedDomain: "", clientId: "")
        .signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // final GoogleAuthCredential credential = GoogleAuthProvider.getCredential()

    // Once signed in, return the UserCredential
    var result = await FirebaseAuth.instance.signInWithCredential(credential);
    var user = result.user;
    print("----------------------${user.displayName}");
    if (user != null) {
      print("----------------------${user.displayName}");
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore.collection("UserInfo").doc(user.uid).set({
        'userName': user.displayName,
        'userProfileImage': "",
        'userXpPoint': 0
      }).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GenderPage()));
      });
    }
  }

  // Future<void> signInWithFacebook() async {
  //   try {
  //     // show a circular progress indicator
  //     // setState(() {
  //     //   _checking = true;
  //     // });
  //     _accessToken = await FacebookAuth.instance
  //         .login(); // by the fault we request the email and the public profile
  //     print("accessToken=========================");
  //     // loginBehavior is only supported for Android devices, for ios it will be ignored
  //     // _accessToken = await FacebookAuth.instance.login(
  //     //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
  //     //   loginBehavior:
  //     //       LoginBehavior.DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
  //     // );
  //     //_printCredentials();
  //     // get the user data
  //     // by default we get the userId, email,name and picture

  //     final FacebookAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(_accessToken.token);
  //     FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  //     final userData = await FacebookAuth.instance.getUserData();

  //     // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //     _userData = userData;
  //     print("====================${_userData['name']}");

  //     if (FirebaseAuth.instance.currentUser.uid != null) {
  //       FirebaseFirestore.instance
  //           .collection("UserInfo")
  //           .doc(FirebaseAuth.instance.currentUser.uid)
  //           .set({
  //         'userName': _userData['name'],
  //         'userProfileImage': "",
  //         'userXpPoint': 0
  //       }).then((value) {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => GenderPage()));
  //       });
  //     }

  //     print("====================${_userData['email']}");
  //   } on FacebookAuthException catch (e) {
  //     // if the facebook login fails
  //     print(e.message); // print the error message in console
  //     // check the error type
  //     switch (e.errorCode) {
  //       case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
  //         print("You have a previous login operation in progress");
  //         break;
  //       case FacebookAuthErrorCode.CANCELLED:
  //         print("login cancelled");
  //         break;
  //       case FacebookAuthErrorCode.FAILED:
  //         print("login failed");
  //         break;
  //     }
  //   } catch (e, s) {
  //     // print in the logs the unknown errors
  //     print(e);
  //     print(s);
  //   } finally {
  //     // update the view
  //     // setState(() {
  //     //   _checking = false;
  //     // });
  //   }
  // }

//This facebook is active------------------------
  // Future<void> signInWithFacebook() async {
  //   try {
  //     // show a circular progress indicator
  //     // setState(() {
  //     //   _checking = true;
  //     // });

  //     _accessToken = (await FacebookAuth.instance.login())
  //         as AccessToken; // by the fault we request the email and the public profile
  //     print("accessToken=========================");
  //     // loginBehavior is only supported for Android devices, for ios it will be ignored
  //     // _accessToken = await FacebookAuth.instance.login(
  //     //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
  //     //   loginBehavior:
  //     //       LoginBehavior.DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
  //     // );
  //     //_printCredentials();
  //     // get the user data
  //     // by default we get the userId, email,name and picture

  //     final FacebookAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(_accessToken.token);
  //     FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential)
  //         .then((value) async {
  //       print("=====================${value.user.uid}");
  //       if (value.user.uid != null) {
  //         final userData = await FacebookAuth.instance.getUserData();

  //         // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //         _userData = userData;
  //         print("====================${_userData['name']}");
  //         print("====================${value.user.photoURL}");

  //         FirebaseFirestore.instance
  //             .collection("UserInfo")
  //             .doc(value.user.uid)
  //             .set({
  //           'userName': _userData['name'],
  //           'userProfileImage': value.user.photoURL,
  //           'userXpPoint': 0
  //         }).then((value) {
  //           Navigator.push(_scaffoldKey.currentContext,
  //               MaterialPageRoute(builder: (context) => Profile()));
  //         });

  //         print("====================${_userData['email']}");
  //       }
  //     });

  //     // final userData = await FacebookAuth.instance.getUserData();

  //     // // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //     // _userData = userData;
  //     // print("====================${_userData['name']}");

  //     // print("=====================${FirebaseAuth.instance.currentUser.uid}");

  //     // if (FirebaseAuth.instance.currentUser.uid != null) {
  //     //   FirebaseFirestore.instance
  //     //       .collection("UserInfo")
  //     //       .doc(FirebaseAuth.instance.currentUser.uid)
  //     //       .set({
  //     //     'userName': _userData['name'],
  //     //     'userProfileImage': "",
  //     //     'userXpPoint': 0
  //     //   }).then((value) {
  //     //     Navigator.push(
  //     //         context, MaterialPageRoute(builder: (context) => Profile()));
  //     //   });
  //     // }

  //     // print("====================${_userData['email']}");
  //   } catch (e) {
  //     print(e);

  //     // } on FacebookAuthException catch (e) {
  //     //   // if the facebook login fails
  //     //   print(e.message); // print the error message in console
  //     //   // check the error type
  //     //   switch (e.errorCode) {
  //     //     case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
  //     //       print("You have a previous login operation in progress");
  //     //       break;
  //     //     case FacebookAuthErrorCode.CANCELLED:
  //     //       print("login cancelled");
  //     //       break;
  //     //     case FacebookAuthErrorCode.FAILED:
  //     //       print("login failed");
  //     //       break;
  //     //   }
  //   } catch (e, s) {
  //     // print in the logs the unknown errors
  //     print(e);
  //     print(s);
  //   } finally {
  //     // update the view
  //     // setState(() {
  //     //   _checking = false;
  //     // });
  //   }
  // }

  signIn() async {
    //showLoaderDialog(context);
    email = emailController.text;
    passsword = passwordController.text;

    setState(() {
      errorPassword = false;
      errorEmail = false;
    });
    if (!email.contains("@") || !email.contains(".") || email.isEmpty) {
      setState(() {
        errorEmail = true;
      });

      // Navigator.pop(context);
    } else if (passsword.isEmpty) {
      setState(() {
        errorPassword = true;
      });

      // Navigator.pop(context);
    } else {
      setState(() {
        errorPassword = false;
        errorEmail = false;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: passsword);
        if (userCredential != null) {
          uemail = userCredential.user.email;
          uid = userCredential.user.uid;
          emailController.clear();
          passwordController.clear();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Home(
                    newSelectedIndex: 4,
                  )));
        }
        print('This Is Output of Credention $uid');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email!');
          setState(() {
            errorEmail = true;
          });
          // _scaffoldKey.currentState.showSnackBar(
          //     SnackBar(content: Text("No user found for that email!")));
          // Navigator.pop(context);
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          setState(() {
            errorPassword = true;
          });
          // _scaffoldKey.currentState.showSnackBar(SnackBar(
          //     content: Text("Wrong password provided for that user!")));
          // Navigator.pop(context);
        }
      }
    }
  }

  @override
  void dispose() {
    Navigator.pop(context);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //+++++++++++++++++++++++ BackEnd Code +++++++++++++++++++++++++++++

    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // ignore: unused_local_variable
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
                      'Log In',
                      style: TextStyle(fontSize: 24),
                    ),
                    // Center(
                    //   child: Image.asset(
                    //     "assets/logo.png",
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    SizedBox(
                      height: hp * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 5),
                        //   child: Text(
                        //     "Email",
                        //     style: TextStyle(
                        //       fontFamily: 'TTCommons',
                        //       fontSize: 18,
                        //       color: _colorFromHex("#FEC62D"),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            controller: emailController,
                            autofocus: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle_outlined),
                              hintText: 'Your Email here',
                              errorText: errorEmail == true
                                  ? "Please Enter Valid Email!"
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: hp * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            controller: passwordController,
                            autofocus: true,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Your Password',
                              errorText: errorPassword == true
                                  ? "Please Enter Valid Password!"
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: hp * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MaterialButton(
                        height: hp * 0.07,
                        minWidth: hw * 0.7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: () {
                          signIn();
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 14),
                          // style: TextStyle(
                          //     fontFamily: 'DemiBold', color: _colorFromHex('#FEC62D')),
                        ),
                        color: _colorFromHex('#FEC62D'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()));
                        },
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              fontFamily: 'DemiBold',
                              color: _colorFromHex('#181D3D')),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          thickness: 10,
                          height: 30,
                          color: Colors.black,
                        ),
                        // Divider(
                        //   thickness: 1,
                        //   color: Colors.black12,
                        //   height: 5,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "or signin with",
                            style: TextStyle(
                                fontFamily: 'DemiBold',
                                color: _colorFromHex('#181D3D')),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // InkWell(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: SvgPicture.asset("assets/svg/google.svg"),
                        //   ),
                        //   onTap: () {
                        //     signInWithGoogle();
                        //   },
                        // ),
                        // InkWell(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: SvgPicture.asset("assets/svg/fb.svg"),
                        //   ),
                        //   onTap: () {
                        //     signInWithFacebook();
                        //   },
                        // ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("assets/icon/apple.svg"),
                          ),
                          onTap: () async {
                            final appleIdCredential =
                                await SignInWithApple.getAppleIDCredential(
                              scopes: [
                                AppleIDAuthorizationScopes.email,
                                AppleIDAuthorizationScopes.fullName,
                              ],
                            );

                            final oAuthProvider = OAuthProvider('apple.com');
                            final credential = oAuthProvider.credential(
                              idToken: appleIdCredential.identityToken,
                              accessToken: appleIdCredential.authorizationCode,
                            );

                            var appleUser = await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            if (FirebaseAuth.instance.currentUser.uid != null) {
                              FirebaseFirestore.instance
                                  .collection("UserInfo")
                                  .doc(FirebaseAuth.instance.currentUser.uid)
                                  .set({
                                // 'userName': appleUser.user.displayName,
                                'userName': appleUser.user.email,
                                // 'userProfileImage': appleUser.user.photoURL,
                                'userProfileImage': "",
                                'userXpPoint': 0
                              }).then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GenderPage()));
                              });
                            }
                            print(credential.token);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " Don’t have account?",
                              style: TextStyle(
                                  fontFamily: 'DemiBold',
                                  fontSize: 14,
                                  color: _colorFromHex('#000000')),
                            ),
                          ),
                          InkWell(
                            child: Text(
                              "Sign Up?",
                              style: TextStyle(
                                  fontFamily: 'DemiBold',
                                  fontSize: 14,
                                  color: _colorFromHex('#FEC62D')),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: hp * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontFamily: 'DemiBold',
                                  fontSize: 14,
                                  color: _colorFromHex('#000000')),
                            ),
                          ),
                          InkWell(
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => WebView()));
                              _launchurl(
                                  'https://eyebuddy.app/privacy-policy.html');
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Text(
                              'Terms & Conditions',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              _launchurl(
                                  'https://eyebuddy.app/terms-conditions-.html');
                            },
                          ),
                          SizedBox(
                            height: hp * 0.04,
                          ),
                          Container(
                              child: Image.asset('assets/images/world.png')),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}

_launchurl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
}
