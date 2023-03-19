import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFeffbfc),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text(
                  "Elevated Button",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                    // shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                    depth: 7,
                    color: Color(0xFFeffbfc),
                    shadowDarkColor: Color(0xFFd3e4e5),
                    shadowLightColor: Color(0xffffffff),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: Color(0xFF4E8C6F),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Elevated Button',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF4E8C6F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  "Floating Action Bar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  hoverColor: Colors.redAccent,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFeffbfc),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFd3e4e5).withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add),
                  ),
                  backgroundColor: Color.fromRGBO(242, 252, 249, 1),
                  foregroundColor: Color(0xFF4E8C6F),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                const Text(
                  "Text Button",
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
                  "Icon Button",
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
            SizedBox(height: 30.0),
            Row(
              children: [
                const Text(
                  "Dropdown Button",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                DropdownButton<String>(
                  dropdownColor: Color(0xFFeffbfc),
                  items: <String>[
                    'Option 1',
                    'Option 2',
                    'Option 3',
                    'Option 4'
                  ].map((String value) {
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
                  "Popup Menu Button",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: Color(0xFF4E8C6F)),
                  color: Color(0xFFeffbfc),
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
    );
  }
}
