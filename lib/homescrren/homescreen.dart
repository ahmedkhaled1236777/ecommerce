import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Features/onboarding/data/models/onboardingmodel.dart';
import '../Features/onboarding/presentation/view/widgets/onboardingitem.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => homestate();
}

class homestate extends State<home> {
  List types = [
    "Smart Phone",
    "Home Application",
    "Televisions",
    "Clothing",
    "Sports"
  ];
  PageController controller = PageController();
  List<onboardingmodel> onboardingl = [
    onboardingmodel(
        "assets/images/bb.jpg", "Online Order", "you can shooping online"),
    onboardingmodel("assets/images/aa.jpg", "Sales", "There is big sales"),
    onboardingmodel("assets/images/cc.jpg", "Delivery Service",
        "There is an delivery service")
  ];
  List<onboardingmodel> onboardingll = [
    onboardingmodel(
        "assets/images/dd.jpg", "Online Order", "you can shooping online"),
    onboardingmodel("assets/images/ss.jpg", "Sales", "There is big sales"),
    onboardingmodel("assets/images/mm.jpg", "Delivery Service",
        "There is an delivery service")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xff175adc,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
                elevation: 10,
                backgroundColor: Colors.amber.withOpacity(0.8),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: "home"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.percent,
                        color: Colors.white,
                      ),
                      label: "person"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.cabin,
                        color: Colors.white,
                      ),
                      label: "car"),
                ]),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 25),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.5)),
                                    prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.white.withOpacity(0.7),
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3)),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3))),
                                    fillColor: Colors.white.withOpacity(0.3),
                                    filled: true),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Badge(
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            label: Text("0"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.16,
                color: Color(
                  0xff175adc,
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 1,
                              );
                            },
                            itemCount: types.length,
                            itemBuilder: (context, int index) {
                              return TextButton(
                                onPressed: () {},
                                child: Text(
                                  types[index],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  onPageChanged: (value) {},
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      child: Image.asset(
                                        onboardingl[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                    );
                                  }),
                                  itemCount: onboardingl.length,
                                  controller: controller,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SmoothPageIndicator(
                                controller: controller,
                                count: onboardingl.length,
                                effect: WormEffect(
                                    dotColor: Color(
                                      0xffffAE17,
                                    ),
                                    dotHeight: 7,
                                    dotWidth: 7),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text("Super Summer Sale",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            Text("View All",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        child: Image.asset(
                                          onboardingll[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                        height: 100,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        onboardingl[index].title,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("${125}"),
                                          Text("\$"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "21255",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          )
                                        ],
                                      )
                                    ]);
                              },
                              separatorBuilder: (context, int index) {
                                return SizedBox(
                                  width: 5,
                                );
                              },
                              itemCount: onboardingl.length),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text("Deal of a Day",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            Text("View All",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        child: Image.asset(
                                          onboardingll[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                        height: 100,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        onboardingl[index].title,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("${125}"),
                                          Text("\$"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "21255",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          )
                                        ],
                                      )
                                    ]);
                              },
                              separatorBuilder: (context, int index) {
                                return SizedBox(
                                  width: 5,
                                );
                              },
                              itemCount: onboardingl.length),
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
