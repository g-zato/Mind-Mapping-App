import 'dart:math';

import 'package:flutter/material.dart';
import '../components/Nodulo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isActive = false;
  var numNodulos = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.greenAccent,
          child: InteractiveViewer(
            constrained: false,
            scaleEnabled: true,
            minScale: 0.01,
            maxScale: 1.5,
            boundaryMargin: EdgeInsets.all(1500),
            child: Container(
              child: Row(
                children: [], //List.generate(numNodulos, (index) => null),
              ),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            isActive == true
                ? FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        numNodulos++;
                      });
                    },
                    backgroundColor: Colors.lightBlueAccent.shade100,
                    child: Transform.rotate(
                        angle: 0,
                        child: Icon(Icons.control_point_duplicate_rounded)),
                  )
                : Text(''),
            isActive == true
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: FloatingActionButton(
                      onPressed: null,
                      backgroundColor: Colors.lightBlueAccent.shade100,
                      child: Transform.rotate(
                        child: Icon(Icons.alt_route_rounded),
                        angle: pi / 2,
                      ),
                    ),
                  )
                : Text(''),
            FloatingActionButton(
              onPressed: () {
                if (isActive)
                  setState(() {
                    isActive = false;
                  });
                else
                  setState(() {
                    isActive = true;
                  });
              },
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.add),
            ),
          ],
        ));
    ;
  }
}
