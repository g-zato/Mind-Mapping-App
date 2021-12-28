import 'package:flutter/material.dart';
import 'dart:math';

import 'buttons/CreateSonButton.dart';
import 'buttons/CreateBroButton.dart';

class NodeOptions extends StatelessWidget {
  var createSon;
  var createBro;
  bool isFirst;

  NodeOptions(this.createSon, this.createBro, this.isFirst);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: isFirst
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CreateSonButton(createSon)],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CreateSonButton(createSon),
                  CreateBroButton(createBro)
                ],
              ));
  }
}
