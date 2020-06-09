import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String _respons = "No Results Yet";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Scan QR Code",
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Results",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                /*Text(
                  _respons,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),*/
                TextField(
                  readOnly: true,
                  controller: control,
                  decoration: InputDecoration(hintText: "Just Scan A Code"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () async {
                    String scanning = await BarcodeScanner.scan();
                    setState(() {
                      control.text = scanning;
                    });
                  },
                  child: Text(
                    "Press to Scan QR",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.deepPurpleAccent, width: 3.0),
                      borderRadius: BorderRadius.circular(20.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  final control = TextEditingController();
}
