import 'package:flutter/material.dart';

class textformfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final String valid;
  Widget? icon;
  textformfield(
      {super.key,
      this.icon,
      required this.controller,
      required this.hinttext,
      required this.valid});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty || value == null) return valid;
        },
        decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: const Color(0xffc5c5c7).withOpacity(0.3),
              ),
            ),
            filled: true,
            fillColor: Color(0xffc5c5c7).withOpacity(0.3),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  28,
                ),
                borderSide:
                    BorderSide(color: Color(0xffc5c5c7).withOpacity(0.3)))),
      ),
    );
  }
}
