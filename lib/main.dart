import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

void NoveKoordinate() {
  Random _slucajanBroj = Random();
  double osX = -0.5 +_slucajanBroj.nextDouble();
  double osY = -0.5 +_slucajanBroj.nextDouble();
  Firestore.instance
      .collection("baby")
      .document("values")
      .updateData({"osx": osX, "osy": osY});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moving Container',
      home: MovingContainer(),
    );
  }
}

class MovingContainer extends StatefulWidget {
  @override
  _MovingContainerState createState() => _MovingContainerState();
}

class _MovingContainerState extends State<MovingContainer> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<DocumentSnapshot>(
        stream: db.collection("baby").document("values").snapshots(),
        builder: (context, snapshot) {
          Map data = snapshot.data.data;

          return Container(
            color: Colors.amber,
            child: GestureDetector(
              onTap: NoveKoordinate,
              child: FlutterLogo(
                size: 200,
              ),
            ),
            alignment: Alignment(data["osx"], data["osy"]),
          );
        });
  }
}
