import 'package:flutter/material.dart';

class CreateSonButton extends StatelessWidget {
  var createSon;

  CreateSonButton(this.createSon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: createSon,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: Colors.amber,
          ),
          padding: EdgeInsets.all(5),
          child: Icon(Icons.add)),
    );
  }
}
