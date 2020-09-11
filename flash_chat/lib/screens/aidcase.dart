import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import '../constants.dart';

class AIDCASE extends StatefulWidget {
  String age;
  String myActivity;
  String description;
  AIDCASE({this.myActivity, this.age, this.description});

  @override
  _FIRSTAID createState() => _FIRSTAID(myActivity, age, description);
}

class _FIRSTAID extends State<AIDCASE> {
  String age;
  String myActivity;
  String description;
  String _myActivityResult;
  String assetPDFPath = "";
  var userInput = 'c';
  String urlPDFPath = "";
  final formKey = new GlobalKey<FormState>();
  _FIRSTAID(this.myActivity, this.age, this.description);

  @override
  void initState() {
    super.initState();
    _myActivityResult = '';

    switch (description) {
      case 'nose bleeding':
        getFileFromAsset("assets/nosebleed.pdf").then((f) {
          setState(() {
            assetPDFPath = f.path;
            print(assetPDFPath);
          });
        });
        break;
      case 'shock':
        getFileFromAsset("assets/Shock.pdf").then((f) {
          setState(() {
            assetPDFPath = f.path;
            print(assetPDFPath);
          });
        });
        break;
      default:
        getFileFromAsset("assets/default.pdf").then((f) {
          setState(() {
            assetPDFPath = f.path;
            print(assetPDFPath);
          });
        });
    }
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/1.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: Center(
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
                      child: Text("Gender: $myActivity"),
                    ),
                    Text("Age: $age"),
                    SizedBox(height: 20),
                    Text("Description: $description"),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RaisedButton(
                          child: Text('Get Aid'),
                          onPressed: () async {
                            if (assetPDFPath != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PdfViewPage(path: assetPDFPath)));
                            }
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

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Document"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage + 1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}
