import 'package:flash_chat/components/bottom_button.dart';
import 'package:flash_chat/components/constants.dart';
import 'package:flash_chat/components/reusable_card.dart';

import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmiresult,
      @required this.interpretation,
      @required this.resultText});

  final String bmiresult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
              alignment: Alignment.bottomRight,
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
                  color: Colors.white,                       
                  label: Text(''), //`Text` to display
                  icon: Icon(Icons.share), //`Icon` to display
                  onPressed: () {
                    //Code to execute when Floating Action Button is clicked
                    //...
                  },
                ),
             ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: resulttitle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: resulttext,
                  ),
                  Text(
                    bmiresult,
                    style: bmi,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: resultbody,
                  )
                ],
              ),
            ),
            flex: 5,
          ),
          BottomButton(
            ontap: () {
              Navigator.pop(context);
            },
            buttontitle: 'Re-Calculate'.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
