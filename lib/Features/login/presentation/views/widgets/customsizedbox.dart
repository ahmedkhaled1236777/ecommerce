import 'package:flutter/material.dart';

class customsizedbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.only(left: 10, top: 100),
        child: Text(
          "Sign in",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
