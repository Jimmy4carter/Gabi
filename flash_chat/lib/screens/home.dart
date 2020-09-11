import 'package:flash_chat/components/const.dart';
import 'package:flash_chat/components/custom_clipper.dart';
import 'package:flash_chat/screens/autodiagnosis.dart';
import 'package:flash_chat/screens/firstaid.dart';
import 'package:flash_chat/screens/input_page.dart';
import 'package:flash_chat/screens/message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

//final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class Home extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        ClipPath(
          clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Colors.blueAccent,
            height: Constants.headerHeight + statusBarHeight,
          ),
        ),
        Positioned(
          right: -45,
          top: -30,
          child: ClipOval(
            child: Container(
              color: Colors.black.withOpacity(0.05),
              height: 220,
              width: 220,
            ),
          ),
        ),

        // BODY
        Padding(
          padding: EdgeInsets.all(Constants.paddingSide),
          child: ListView(
            children: <Widget>[
              // Header - Greetings and Avatar
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Good Day,\nPatient",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                    radius: 26.0,
                    backgroundImage: AssetImage('assets/icons/Heart.png'),
                  )
                ],
              ),
              SizedBox(height: 50),

              // Main Cards - Heartbeat and Blood Pressure
              Container(
                child: Column(
                  //scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              shape: BoxShape.rectangle,
                              color: Color(0xFFEB1555),
                            ),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),
                                          Text(
                                            "BODY MASS INDEX",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "BMI",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  debugPrint("BMI card clicked");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InputPage()),
                                  );
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              shape: BoxShape.rectangle,
                              color: Color(0xFF3ABD6F),
                            ),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),
                                          Text(
                                            "HEARTBEAT",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "BPM",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  debugPrint("BPM card clicked");
                                  _showMyDialog();
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: Colors.red),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),
                                          Text(
                                            "BLOOD PRESSURE",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "MMHG",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  debugPrint("Bloodpressure card clicked");
                                  _showMyDialog();
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              shape: BoxShape.rectangle,
                              color: Color(0xFF3B72FF),
                            ),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),

                                          Text(
                                            "TEMPERATURE",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "°C",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  debugPrint("Temperature card clicked");
                                  _showMyDialog();
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: Colors.red),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),
                                          Text(
                                            "EMERGENCY",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "FIRST AID",
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  debugPrint("First aid card clicked");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FIRSTAID()),
                                  );
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              shape: BoxShape.rectangle,
                              color: Color(0xFF3B72FF),
                            ),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),

                                          Text(
                                            "AUTO DIAGNOSIS",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Auto D",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  debugPrint("Auto diagnosis card clicked");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AUTODIAGNOSIS()),
                                  );
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: ((MediaQuery.of(context).size.width -
                                    (Constants.paddingSide * 2 +
                                        Constants.paddingSide / 2)) /
                                2),
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: Colors.red),
                            child: Material(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Stack(
                                  overflow: Overflow.clip,
                                  children: <Widget>[
                                    Positioned(
                                      child: ClipPath(
                                        clipper: MyCustomClipper(
                                            clipType: ClipType.semiCircle),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon and Hearbeat
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[],
                                          ),
                                          Text(
                                            "",
                                            style: TextStyle(
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "MESSAGE",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Message()),
                                  );
                                },
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Sensor Not Detected'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
