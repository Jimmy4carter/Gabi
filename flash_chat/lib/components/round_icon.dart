import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onButtonPress});

  final IconData icon;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onButtonPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
