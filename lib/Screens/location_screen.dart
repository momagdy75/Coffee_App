import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../bottom_nav_bar.dart';
import '../constant.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool isOpen = false;
  bool visable=true;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor =1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        /*   image: DecorationImage(
            image: AssetImage(
                "assets/images/login.png"),
            fit: BoxFit.fill),*/
        borderRadius:
        isOpen ? BorderRadius.circular(30) : BorderRadius.circular(0),
        color: isOpen ? Colors.brown.shade400 : bgColor,
        image: DecorationImage(
          image:  AssetImage("assets/images/Map.png"),fit:BoxFit.cover ,

        )

      ),
      child: Stack(
          children:[

            SafeArea(
              child: Column(
                children: [
                Appbar(),

                  Spacer(),
                  BottomNavBar(isOpen: isOpen, visable: visable,index: 1,)

                ],
              ),
            ),

          ]
      ),
    );
  }
  Container Appbar() {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isOpen == false) {
                  xOffset = 180;
                  yOffset = 90;
                  scaleFactor = 0.80;
                  isOpen = true;
                  visable=false;
                } else if (isOpen == true) {
                  xOffset = 0;
                  Future.delayed(Duration(milliseconds: 700),(){
                    setState(() {
                      visable=true;
                    });
                  },);
                  yOffset = 0;
                  scaleFactor = 1;
                  isOpen = false;
                }
              });
            },
            icon: isOpen
                ? Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 25,
            )
                : SvgPicture.asset(
              "assets/images/drawer.svg",
            ),
          ),

        ],
      ),
    );
  }
}
