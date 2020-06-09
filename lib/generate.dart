import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String _qr = "commma";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Generate QR Code",
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              QrImage(data: _qr),
              SizedBox(height: 10.0),
              Text("Get your QR Code"),
              TextField(
                controller: _qrText,
                decoration: InputDecoration(hintText: "Enter your Data/Link"),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  if (_qrText.text.isEmpty) {
                    setState(() {
                      _qr = "https://github.com/GamalElsawy";
                    });
                  } else {
                    setState(() {
                      _qr = _qrText.text;
                    });
                  }
                },
                child: Text(
                  "Press to Generate QR",
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
    );
  }

  final _qrText = TextEditingController();
}
