import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.ontap, @required this.buttontitle});

  final Function ontap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: bottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15),
        color: bottomContainerColor,
        child: Center(
          child: Text(
            buttontitle,
            style: buttonstyle,
          ),
        ),
      ),
    );
  }
}
