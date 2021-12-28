import 'package:flutter/material.dart';
import 'dart:math';

class CreateBroButton extends StatelessWidget {
  var createBro;

  CreateBroButton(this.createBro);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: createBro,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
          color: Colors.amber,
        ),
        child: Transform.rotate(
          angle: pi / 2,
          child: Icon(Icons.alt_route_rounded),
        ),
      ),
    );
  }
}
