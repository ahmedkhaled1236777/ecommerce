import 'package:flutter/material.dart';

import '../sign.dart';

class customnoaccountrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account ?"),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return signup();
              }));
            },
            child: const Text(
              "Signup",
            ))
      ],
    );
  }
}
