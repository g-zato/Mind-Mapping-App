import 'package:flutter/material.dart';

class CommonNode extends StatelessWidget {
  bool isSelected;
  ValueNotifier<int?> selectedNode;
  Function setSelectedNode;
  int? nodeId;
  var myFocusNode;

  CommonNode(this.isSelected, this.selectedNode, this.setSelectedNode,
      this.nodeId, this.myFocusNode);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(200),
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(width: 3, color: Colors.amber)
              : Border.all(width: 2, color: Colors.lightBlue.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(60),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              child: Center(
                child: Text('${this.nodeId}'),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
                onChanged: null,
                focusNode: myFocusNode,
                onTap: () {
                  setSelectedNode(nodeId);
                },
                maxLines: null,
                decoration: InputDecoration(
                  focusColor: Colors.amber,
                  contentPadding: EdgeInsets.all(0),
                  hintText: 'Escreva algo!',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
