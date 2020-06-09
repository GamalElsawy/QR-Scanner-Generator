import 'package:flutter/material.dart';
import 'scan.dart';
import 'generate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "JEMY QR",
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("assets/image1.jpg"),
            flatBtn("Scan QR Code", Scan(), context),
            SizedBox(
              height: 10.0,
            ),
            flatBtn("Generate QR Code", Generate(), context),
          ],
        ),
      ),
    );
  }
}

Widget flatBtn(String txt, Widget wid, BuildContext context) {
  return FlatButton(
    padding: EdgeInsets.all(15.0),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => wid));
    },
    child: Text(
      txt,
      style: TextStyle(
          color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
    ),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.deepPurpleAccent, width: 3.0),
        borderRadius: BorderRadius.circular(20.0)),
  );
}
