import 'package:flutter/material.dart';
import 'constants.dart';

class Iconcontents extends StatelessWidget {
  Iconcontents({@required this.icon, @required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: iconsize,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: textstyle,
        ),
      ],
    );
  }
}
