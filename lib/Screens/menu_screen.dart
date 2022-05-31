import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_nav_bar.dart';
import '../constant.dart';
import '../menu_item.dart';

class MenuScreen extends StatefulWidget {

  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();

}

class _MenuScreenState extends State<MenuScreen> {

bool isOpen = false;
  bool visable=true;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return
         AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius:
            isOpen ? BorderRadius.circular(30) : BorderRadius.circular(0),
            color: isOpen ? Colors.brown.shade400 : bgColor,
          ),
          child: Stack(children: [
            SafeArea(
              child: Column(

                children: [
                  Appbar(),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "It's Great ",
                              style: TextStyle(color: Colors.black, fontSize: 32)),
                          TextSpan(
                              text: "Day for \nCoffee.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isOpen ? Colors.white : brownColor,
                                  fontSize: 32))
                        ])),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: coffeeNames.length,
                      itemBuilder: (context, index) => MenuItem(coffeeNames: coffeeNames, isOpen: isOpen,index: index),
                    ),
                  ),
                  BottomNavBar(isOpen: isOpen, visable: visable,index: 2,)


                ],
              ),
            ),
          ]),
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
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/images/search.svg"))
                    ],
                  ),
                );
  }
}




