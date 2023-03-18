import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
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
            backgroundColor: Color(0xFF4E8C6F),
            title: const Text("Widgets"),
            bottom: const TabBar(
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
            child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("accountEmail"),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person),
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
                child: Center(
                  child: Text("This is a text widget"),
                ),
              ),
              Container(
                child: Center(
                  child: Image.asset(
                    'images/download.jpeg',
                    width: 300,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Elevated Button",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF4E8C6F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  fixedSize: const Size(150, 50)),
                              child: const Text(
                                "Elevated Button",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            "Floating Action Bar",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(Icons.add),
                            backgroundColor: Color(0xFF4E8C6F),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          const Text(
                            "Text Button",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Text Button',
                                style: TextStyle(color: Color(0xFF4E8C6F))),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: [
                          const Text(
                            "Icon Button",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Color(0xFF4E8C6F),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: [
                          const Text(
                            "Dropdown Button",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          DropdownButton<String>(
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: [
                          const Text(
                            "PopupMenu Button",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'option 1',
                                  child: Text('Option 1'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'option 2',
                                  child: Text('Option 2'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'option 3',
                                  child: Text('Option 3'),
                                ),
                              ];
                            },
                            onSelected: (String value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Checkbox(),
            ],
          ),
        ));
  }
}

class Checkbox extends StatefulWidget {
  const Checkbox({super.key, required bool value});

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  bool _isChecked = false;
  int _radioValue = 0;
  bool _switchValue = false;
  double _sliderValue = 0.0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _handleSwitchValueChange(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  void _handleSliderValueChange(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              const Text(
                "Checkbox",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Checkbox(value: _isChecked, onChanged: )
            ]),
            SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  "Radio",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xFF4E8C6F),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                const Text(
                  "Switch",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button',
                      style: TextStyle(color: Color(0xFF4E8C6F))),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                const Text(
                  "Slider",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Color(0xFF4E8C6F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
