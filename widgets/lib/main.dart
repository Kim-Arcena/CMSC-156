import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:widgets/button.dart';

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
            backgroundColor: Color(0xFFf4fbfc),
            foregroundColor: Colors.black,
            elevation: 4,
            title: const Text("Widgets"),
            bottom: const TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xFF3b775a),
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
                color: Color(0xFFeffbfc),
                child: Center(
                  child: Text("This is a text widget"),
                ),
              ),
              Container(
                color: Color(0xFFeffbfc),
                child: Center(
                  child: Image.asset(
                    'images/blue.jpg',
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

enum PaymentMethod {
  creditCard,
  debitCard,
}

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  bool _isSelected = false;
  PaymentMethod? _selectedPaymentMethod = PaymentMethod.creditCard;
  bool _isSwitched = false;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text(
                  "Checkbox",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: _isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isSelected = value!;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  "Radio Button",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio<PaymentMethod>(
                          value: PaymentMethod.creditCard,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (PaymentMethod? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        Text('Credit Card'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<PaymentMethod>(
                          value: PaymentMethod.debitCard,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (PaymentMethod? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        Text('Debit Card'),
                      ],
                    ),
                  ],
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
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                )
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
                Expanded(
                    child: Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 100.0,
                  label: _sliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
