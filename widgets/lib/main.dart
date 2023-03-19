import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:widgets/button.dart';

import 'selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFeffbfc),
            foregroundColor: Colors.black,
            elevation: 10,
            shadowColor: Color(0xFFd3e4e5).withOpacity(0.4),
            title: const Text("Widgets"),
            bottom: const TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xFF3b775a),
              indicatorColor: Color(0xFF8fc6af),
              tabs: [
                Tab(
                  text: "Text",
                ),
                Tab(
                  text: "Image",
                ),
                Tab(
                  text: "Buttons",
                ),
                Tab(
                  text: "Selection",
                ),
              ],
            ),
          ),
          drawer: Drawer(
            backgroundColor: Color(0xFFeffbfc),
            child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF8fc6af),
                ),
                accountName: Text("John Doe"),
                accountEmail: Text("accountEmail"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color(0Xffc9eadc),
                  child: Icon(Icons.person, color: Color(0xFF3b775a)),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Color(0xFFeffbfc),
                child: Center(
                  child: Text("This is a text widget"),
                ),
              ),
              Container(
                color: Color(0xFFeffbfc),
                child: Center(
                  child: Image.asset(
                    'images/light_blue.jpg',
                    width: 300,
                  ),
                ),
              ),
              Button(),
              Selection(),
            ],
          ),
        ));
  }
}
