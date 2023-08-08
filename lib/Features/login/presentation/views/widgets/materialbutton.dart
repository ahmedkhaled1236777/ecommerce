import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class materialbutton extends StatelessWidget {
  final Future<void> function;
  final String name;

  const materialbutton({super.key, required this.function, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        function;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 13, bottom: 13),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      color: Color(0xff175ADC),
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff175ADC)),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
