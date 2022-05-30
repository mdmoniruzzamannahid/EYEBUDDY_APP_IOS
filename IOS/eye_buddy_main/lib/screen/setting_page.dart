import 'package:eye_buddy/model/sub_provider_mode.dart';
import 'package:eye_buddy/screen/helpandsupport.dart';
import 'package:eye_buddy/screen/homepage/eye_test/eye_test.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';

//-------------------LN Start------------------------

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

String selectedNotificationPayload;

//-------------------LN End-------------------------------------------

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();

  //------------------------LN Start--------------------------------------

  //------------------------LN End--------------------------------------
}

class _SettingPageState extends State<SettingPage> {
  bool _morning = false;
  bool _evening = false;

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    //final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
    //tz.setLocalLocation(tz.getLocation(timeZoneName));
    //tz.setLocalLocation(tz.getLocation('America/Detroit'));
    // tz.setLocalLocation(tz.getLocation('Asia/Dhaka'));
    tz.setLocalLocation(tz.getLocation('America/Toronto'));
  }

  initial() async {
    // WidgetsFlutterBinding.ensureInitialized();

    _configureLocalTimeZone();

    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    //String initialRoute = HomePage.routeName;
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload = notificationAppLaunchDetails.payload;
      // initialRoute = SecondPage.routeName;
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification:
                (int id, String title, String body, String payload) async {
              didReceiveLocalNotificationSubject.add(ReceivedNotification(
                  id: id, title: title, body: body, payload: payload));
            });
    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      selectedNotificationPayload = payload;
      selectNotificationSubject.add(payload);
    });
  }

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((value) {
      _morning = value.getBool("morningNotification") != null
          ? value.getBool("morningNotification")
          : false;
      _evening = value.getBool("eveningNotification") != null
          ? value.getBool("eveningNotification")
          : false;
      print(_morning);
      print(_evening);
      setState(() {});
    });

    initial();

    _requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
    // _scheduleDailySixAMNotification();
    // _scheduleDailySixPMNotification();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                // Navigator.of(context, rootNavigator: true).pop();
                // await Navigator.push(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) =>
                //         SecondPage(receivedNotification.payload),
                //   ),
                // );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  //-------------------Morning Start --------------------

  Future<void> _scheduleDailySixAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Morning:',
        'Time to Power up your eyes 💪',
        _nextInstanceOfSixAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfSixAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 06, 00);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
  //---------------------- Morning End----------------------
  //---------------------- Evening Start----------------------

  Future<void> _scheduleDailySixPMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Evening: Your eyes worked hard ALL DAY.',
        'Let us relax them with Evening Workout.😌',
        _nextInstanceOfSixPM(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfSixPM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 18, 00);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
  //---------------------- Evening End----------------------

  Future<void> _cancelMorningNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  Future<void> _cancelEveningNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1);
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.pushNamed(context, '/secondPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SETTINGS',
          style: TextStyle(fontSize: 18, color: colorFromHex('#181D3D')),
        ),
        backgroundColor: Colors.white,
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                _tab(
                    "Remind Morning Training",
                    CupertinoSwitch(
                      activeColor: ColorConfig.yeallow,
                      trackColor: colorFromHex('#B7AE97'),
                      value: _morning,
                      onChanged: (value) {
                        setState(() {
                          _morning = value;
                          if (value) {
                            _scheduleDailySixAMNotification();
                            SharedPreferences.getInstance().then((value) {
                              value.setBool("morningNotification", true);
                            });
                            print("M_ON");
                          } else {
                            _cancelMorningNotification();
                            SharedPreferences.getInstance().then((value) {
                              value.setBool("morningNotification", false);
                            });
                            print("M_OFF");
                          }
                        });
                      },
                    ),
                    'morning'),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),
                _tab(
                    "Remind Evening Training",
                    CupertinoSwitch(
                      activeColor: ColorConfig.yeallow,
                      trackColor: colorFromHex('#B7AE97'),
                      value: _evening,
                      onChanged: (value) {
                        setState(() {
                          _evening = value;

                          if (value) {
                            _scheduleDailySixPMNotification();
                            SharedPreferences.getInstance().then((value) {
                              value.setBool("eveningNotification", true);
                            });
                            print("E_ON");
                          } else {
                            _cancelEveningNotification();
                            SharedPreferences.getInstance().then((value) {
                              value.setBool("eveningNotification", false);
                            });
                            print("E_OFF");
                          }
                        });
                      },
                    ),
                    'evening'),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),
                _tab(
                    "Per Training Duration",
                    Container(
                      width: 50,
                      height: 30,
                      child: TextField(
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                    'per training duration'),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EyeTest()));
                  },
                  child: _tab("Eye Test", Icon(Icons.arrow_right), 'eye_test'),
                ),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),
                // _tab("Profile",InkWell(child: ,
                // onTap: (){},)),
                InkWell(
                  child: _tab("Stats", Icon(Icons.arrow_right), 'stats'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(
                                  newSelectedIndex: 3,
                                )));
                  },
                ),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HelpandSupport()));
                  },
                  child: _tab("Help & Support", Icon(Icons.arrow_right),
                      'per training duration'),
                ),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),
                InkWell(
                  onTap: _launchURL,
                  child: _tab(
                      "Take Our Survey", Icon(Icons.arrow_right), 'survey'),
                ),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),

                InkWell(
                    child: _tab("Log out", Icon(Icons.arrow_right), 'logout'),
                    onTap: () {
                      // showLoaderDialog(context);
                      CircularProgressIndicator();
                      FirebaseAuth.instance.signOut();

                      FirebaseAuth.instance
                          .authStateChanges()
                          .listen((User user) {
                        if (user == null) {
                          var provider = Provider.of<ProviderModel>(context,
                              listen: false);
                          provider.myPurchasedProductStatus = 'false';
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(
                                    newSelectedIndex: 0,
                                  )));

                          //Navigator.pop(context);
                          print('User is currently signed out!');
                        } else {
                          print('User is signed in!');
                        }
                      });
                    }),
                Divider(
                  thickness: 1,
                  color: ColorConfig.yeallow,
                  indent: 60,
                ),

                Padding(
                  padding: EdgeInsets.all(50),
                  child: Text(
                    'Version 2.0.0',
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorConfig.black,
                        letterSpacing: 2.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSdRnMxvTXaBIxk2vUdHQnYDMKwjr3QKIwdSyKkM4Vg3-3rKaA/viewform?usp=sf_link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _tab(String title, Widget _widget, logo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: ColorConfig.yeallow,
                  // ),
                  shape: BoxShape.circle,
                  color: ColorConfig.yeallow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/svg/$logo.svg'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    color: ColorConfig.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        _widget,
      ],
    );
  }
}
