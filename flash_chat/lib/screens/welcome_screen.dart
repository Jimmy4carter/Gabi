import 'package:flash_chat/components/button.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      /*upperBound: 100.0*/
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation2 = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    // looped animation
    //controller.reverse(from: 1.0);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      //print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 100,
                  ),
                ),
                ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Logo");
                  },
                  text: [
                    'G3 Health',
                    'G3 Health',
                    'G3 Health',
                    'G3 Health',
                    'G3 Health',
                    'G3 Health',
                  ],
                  colors: [
                    Colors.blueAccent,
                    Colors.red,
                    Colors.yellow,
                    Colors.red,
                    Colors.green,
                  ],
                  //textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart, // or Alignment.topLeft,
                  textStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Buttons(
              text: 'Log In',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.id,
                );
              },
              color: Colors.lightBlueAccent,
            ),
            Buttons(
              text: 'Register',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RegistrationScreen.id,
                );
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
