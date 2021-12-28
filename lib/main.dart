import 'package:flutter/material.dart';
import 'package:flutter_app/pages/User.dart';
import 'Navbar.dart';
import './pages/Home.dart';
import './pages/Search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final pages = [Home(), TreeViewPage(), User()];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Colors.greenAccent,
      ),
      home: Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Teste'),
          backgroundColor: Colors.greenAccent,
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            unselectedItemColor: Colors.greenAccent.shade700,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.greenAccent,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                title: Text('User'),
              )
            ],
            onTap: (index) => {
                  setState(() {
                    currentIndex = index;
                  })
                }),
      ),
    );
  }
}
