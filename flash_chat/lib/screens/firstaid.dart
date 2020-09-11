import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flash_chat/screens/aidcase.dart';
import '../constants.dart';

class FIRSTAID extends StatefulWidget {
  @override
  _FIRSTAID createState() => _FIRSTAID();
}

class _FIRSTAID extends State<FIRSTAID> {
  String age;
  String myActivity;
  String _myActivityResult;
  String assetPDFPath = "";
  String description = "";
  String urlPDFPath = "";
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    myActivity = '';
    _myActivityResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIRST AID'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16),
                      child: DropDownFormField(
                        titleText: 'GENDER',
                        hintText: 'SELECT GENDER',
                        value: myActivity,
                        onSaved: (value) {
                          setState(() {
                            myActivity = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            myActivity = value;
                          });
                        },
                        dataSource: [
                          {
                            "display": "MALE",
                            "value": "MALE",
                          },
                          {
                            "display": "FEMALE",
                            "value": "FEMALE",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        age = value;
                      },
                      decoration:
                          kreginput.copyWith(hintText: 'Enter your age'),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 10,
                      minLines: 9,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (text) {
                        description = text;
                      },
                      decoration:
                          kreginput.copyWith(hintText: 'Enter aid desciption'),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RaisedButton(
                          child: Text('Get Aid'),
                          onPressed: () {
                            debugPrint("Get Aid Clicked");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AIDCASE(
                                      myActivity: myActivity,
                                      age: age,
                                      description: description)),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(_myActivityResult),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
