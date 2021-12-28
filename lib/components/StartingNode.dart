import 'package:flutter/material.dart';

class StartingNode extends StatelessWidget {
  bool isSelected;
  ValueNotifier<int?> selectedNode;
  Function setSelectedNode;
  int? nodeId;
  var myFocusNode;

  StartingNode(this.isSelected, this.selectedNode, this.setSelectedNode,
      this.nodeId, this.myFocusNode);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      width: 350,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(width: 3, color: Colors.amber)
              : Border.all(width: 2, color: Colors.red.shade900),
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
                  hintText: 'Mensagem de boas-vindas',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
