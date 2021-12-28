// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import '../components/Nodulo.dart';

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  var json;
  var selectedNode = ValueNotifier<int>(0);
  final controller = TransformationController();

  addNode() {
    int newId = json["nodes"].length + 1;
    json['nodes'].add({"id": newId, "label": 'NEW NODE'});
    return newId;
  }

  void addEdge(from, to) {
    graph.addEdge(Node.Id(from), Node.Id(to));
  }

  void resetZoom() {
    //print(Node.Id(selectedNode.value));
    controller.value = Matrix4.identity();
  }

  void createSon() {
    int newId = addNode();
    setState(() {});
    json['edges'].add({"from": selectedNode.value, "to": newId});
    addEdge(selectedNode.value, newId);
  }

  void createBro() {
    int newId = addNode();
    var previousNode = json['edges']
        .firstWhere((element) => element["to"] == selectedNode.value);
    int previousConnection = previousNode['from'];
    //roda até a linha acima
    json['edges']!.add({"from": previousConnection, "to": newId}) as Map?;
    setState(() {});
    addEdge(previousConnection, newId);
  }

  void deleteNode() {
    var edges = json['edges'];
    var nodes = json['nodes'];
    //Inicializa array com o valor do node selecionado
    var nodeIdArray = [selectedNode.value];
    //Passa por todas as edges
    for (var i = 0; i < edges.length; i++) {
      //Para cada edge, comparar com todos os valores da array de nódulos a serem excluidos
      for (var index = 0; index < nodeIdArray.length; index++) {
        //Quando edge vier de algum dos valores da array, deverá ser excluído também
        if (edges[i]['from'] == nodeIdArray[index]) {
          nodeIdArray.add(edges[i]['to']);
        }
      }
    }
    print(nodeIdArray);

    setState(() {
      nodeIdArray.forEach((element) {
        json['nodes'].removeWhere((node) => node['id'] == element);
        json['edges'].removeWhere(
            (node) => node['from'] == element || node['to'] == element);
      });
      graph.removeNode(Node.Id(nodeIdArray[0]));
    });
    print(json);
  }

  setSelectedNode(newNodeId) {
    selectedNode.value = newNodeId;
    print(selectedNode.value);
  }

  initializeGraph() {
    json = {
      "nodes": [
        {"id": 1, "label": 'Início'}
      ],
      "edges": []
    };
    var nodes = json['nodes']!;
    graph.addNode(Node.Id(1));

    builder
      ..siblingSeparation = (20)
      ..levelSeparation = (100)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_LEFT_RIGHT);
  }

  updateGraph(newJson) {
    setState(() {
      json = newJson;
    });
    var edges = json['edges']!;
    edges.forEach((element) {
      var fromNodeId = element['from'];
      var toNodeId = element['to'];
      graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId));
    });

    print('json modificado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          /*   Wrap(
            children: [
              Container(
                width: 100,
                child: TextFormField(
                  initialValue: builder.siblingSeparation.toString(),
                  decoration: InputDecoration(labelText: "Sibling Separation"),
                  onChanged: (text) {
                    builder.siblingSeparation = int.tryParse(text) ?? 100;
                    this.setState(() {});
                  },
                ),
              ),
              Container(
                width: 100,
                child: TextFormField(
                  initialValue: builder.levelSeparation.toString(),
                  decoration: InputDecoration(labelText: "Level Separation"),
                  onChanged: (text) {
                    builder.levelSeparation = int.tryParse(text) ?? 100;
                    this.setState(() {});
                  },
                ),
              ),
              Container(
                width: 100,
                child: TextFormField(
                  initialValue: builder.subtreeSeparation.toString(),
                  decoration: InputDecoration(labelText: "Subtree separation"),
                  onChanged: (text) {
                    builder.subtreeSeparation = int.tryParse(text) ?? 100;
                    this.setState(() {});
                  },
                ),
              ),
              Container(
                width: 100,
                child: TextFormField(
                  initialValue: builder.orientation.toString(),
                  decoration: InputDecoration(labelText: "Orientation"),
                  onChanged: (text) {
                    builder.orientation = int.tryParse(text) ?? 100;
                    this.setState(() {});
                  },
                ),
              ),
            ],
          ),
    */
          Expanded(
            child: InteractiveViewer(
              transformationController: controller,
              constrained: false,
              boundaryMargin: EdgeInsets.all(1000),
              minScale: 0.01,
              maxScale: 2,
              child: GraphView(
                graph: graph,
                algorithm:
                    BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.greenAccent
                  ..strokeWidth = 3
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key!.value as int?;
                  var nodes = json['nodes']!;
                  var nodeValue =
                      nodes.firstWhere((element) => element['id'] == a);
                  return rectangleWidget(nodeValue['id'], nodeValue['label']);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: FloatingActionButton(
            onPressed: resetZoom,
            child: Icon(Icons.zoom_out_map),
            backgroundColor: Colors.purple,
          ),
        ),
        FloatingActionButton(
          onPressed: deleteNode,
          child: Icon(Icons.delete_outline_rounded),
          backgroundColor: Colors.redAccent,
        ),
      ]),
    );
  }

  Widget rectangleWidget(int? id, String? title) {
    return Nodulo(id, title, selectedNode, setSelectedNode, createSon,
        createBro, controller);
  }

  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    initializeGraph();
  }
}
