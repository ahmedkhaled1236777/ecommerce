import 'package:flutter/material.dart';

class customcontactrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/cc.jpg"),
                ),
                const Text("Facebook")
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color(0xffc5c5c7).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(25)),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/cc.jpg"),
                ),
                Text("Google")
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffc5c5c7).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ],
    );
  }
}
