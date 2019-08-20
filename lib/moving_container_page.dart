import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';



class MovingContainer extends StatefulWidget{
  @override
  _MovingContainerState createState() => _MovingContainerState();
}

class _MovingContainerState extends State<MovingContainer> {

    Random _slucajanBroj = Random();
  double osX = 0.0;
  double osY = 0.0;

    _noviOffset(){
      osX = _slucajanBroj.nextDouble();
      osY = _slucajanBroj.nextDouble();
      setState(() {
      });
    }
  @override



  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Moving Logo"),),
          body:
          Container(
            color: Colors.amber,
            child: GestureDetector(
              onTap: _noviOffset,
              child: FlutterLogo(
                size: 200,
              ),
            ),
            alignment: Alignment(osX, osY),
          ),
    );
  }
}








