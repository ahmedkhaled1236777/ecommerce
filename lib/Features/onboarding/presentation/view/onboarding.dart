import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../consts.dart';
import '../../../login/presentation/views/login.dart';
import '../../data/models/onboardingmodel.dart';
import 'widgets/onboardingitem.dart';

class onboarding extends StatelessWidget {
  PageController controller = PageController();
  List<onboardingmodel> onboardingl = [
    onboardingmodel(
        "assets/images/online.png", "Online Order", "you can shooping online"),
    onboardingmodel("assets/images/sale.png", "Sales", "There is big sales"),
    onboardingmodel("assets/images/delivery.png", "Delivery Service",
        "There is an delivery service")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x000000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              onPageChanged: (value) {},
              itemBuilder: ((context, index) {
                return onboardingitem(
                  onboarding: onboardingl[index],
                  size: 0.55,
                );
              }),
              itemCount: onboardingl.length,
              controller: controller,
            )),
            SmoothPageIndicator(
                effect: WormEffect(
                  activeDotColor: kprimarycolor,
                ),
                controller: controller,
                count: onboardingl.length),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return login();
                }));
              },
              child: Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
              color: kprimarycolor,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
