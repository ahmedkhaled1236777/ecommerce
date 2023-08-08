import 'package:ecommerce/Features/onboarding/data/models/onboardingmodel.dart';
import 'package:flutter/material.dart';

class onboardingitem extends StatelessWidget {
  final onboardingmodel onboarding;
  final double size;
  const onboardingitem(
      {super.key, required this.onboarding, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(onboarding.image),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * size,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          onboarding.title,
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          onboarding.title,
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }
}
