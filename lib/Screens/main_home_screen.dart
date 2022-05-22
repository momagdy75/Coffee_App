import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bottom_nav_bar.dart';
import '../constant.dart';
import '../item_Box.dart';

import 'item_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  bool isOpen = false;
  bool visable = true;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

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
      ),
      child: Stack(children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appbar(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: searchColor,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ItemScreen(0);
                            }));
                          } ,
                          child: ItemBox(
                            image: "assets/images/EspressoBox.png",
                            title: "Espresso\nCappuccino",
                            subtitle: "Dark Roast",
                            price: "\$19",

                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ItemScreen(3);
                            }));
                          } ,
                          child: ItemBox(
                              image: "assets/images/MochaBox.png",
                              title: "Mocha\nAmericano",
                              subtitle: "Decaf Pike",
                              price: "\$16",
                              ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ItemScreen(4);
                            }));
                          } ,
                          child: ItemBox(
                              image: "assets/images/LatteBox.png",
                              title: "Caffè\nlatte",
                              subtitle: "Dark Roast",
                              price: "\$14",
                              ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ItemScreen(1);
                            }));
                          } ,
                          child: ItemBox(
                              image: "assets/images/cappuccinoBox.png",
                              title: "cappuccino\nAmerican",
                              subtitle: "Light Roast",
                              price: "\$10",
                             ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ItemScreen(2);
                            }));
                          } ,
                          child: ItemBox(
                              image: "assets/images/MacchiatoBox.png",
                              title: "Caffè\nMacchiato",
                              subtitle: "Decaf Pike",
                              price: "\$13",
                               ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Special For You",
                  style: GoogleFonts.courgette(
                      color: isOpen ? Colors.white : Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ItemScreen(0);
                      }));
                    },
                    child: Container(
                      height: 100,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: boxoneColor,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 16),
                                child: Text(
                                  "Espresso Cappuccino",
                                  style: GoogleFonts.kalam(
                                    color: bgtwoColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Dark Roast",
                                  style: GoogleFonts.kalam(
                                      color: boxtwoColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "\$19",
                                  style: GoogleFonts.kalam(
                                    color: priceColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image(
                            image: AssetImage("assets/images/EspressoBox.png"),
                            width: 90,
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: BottomNavBar(
                  isOpen: isOpen,
                  visable: visable,
                  index: 0,
                ),
              )
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
                  visable = false;
                } else if (isOpen == true) {
                  xOffset = 0;
                  Future.delayed(
                    Duration(milliseconds: 700),
                    () {
                      setState(() {
                        visable = true;
                      });
                    },
                  );
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Coffee",
                  style: GoogleFonts.kaushanScript(
                      textStyle: TextStyle(color: Colors.black, fontSize: 30))),
              TextSpan(
                  text: "Hub",
                  style: GoogleFonts.kaushanScript(
                      textStyle: isOpen
                          ? TextStyle(color: Colors.white, fontSize: 30)
                          : TextStyle(color: brownColor, fontSize: 30)))
            ])),
          )
        ],
      ),
    );
  }
}
