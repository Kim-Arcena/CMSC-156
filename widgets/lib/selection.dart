import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum RadioSelection {
  radio,
  button,
}

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  bool _isSelected = false;
  RadioSelection? _selectedRadioSelection = RadioSelection.radio;
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
      return Color(0xFF67bc93);
    }

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
                        Radio<RadioSelection>(
                          value: RadioSelection.radio,
                          groupValue: _selectedRadioSelection,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xFF67bc93)),
                          onChanged: (RadioSelection? value) {
                            setState(() {
                              _selectedRadioSelection = value;
                            });
                          },
                        ),
                        const Text('Radio'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<RadioSelection>(
                          value: RadioSelection.button,
                          groupValue: _selectedRadioSelection,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xFF67bc93)),
                          onChanged: (RadioSelection? value) {
                            setState(() {
                              _selectedRadioSelection = value;
                            });
                          },
                        ),
                        const Text('Button'),
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
                  activeColor: Color(0xFF67bc93),
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
                  activeColor: Color(0xFFABDBC7),
                  inactiveColor: Colors.black12,
                  thumbColor: Color(0xFF67bc93),
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
