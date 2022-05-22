import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bottom_nav_bar.dart';
import '../constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOpen = false;
  bool visable=true;
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
      child: Stack(
          children:[

            SafeArea(
              child: Column(
                children: [
                Appbar(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 200,
                        width: 335,
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
                                    "Mohamed Magdy Maher",
                                    style: GoogleFonts.kalam(
                                      color: bgtwoColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16,top: 16),
                                  child: Text(
                                    "203121",
                                    style: GoogleFonts.kalam(
                                        color: boxtwoColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,vertical: 16),
                                  child: Text(
                                    "Flutter Developer",
                                    style: GoogleFonts.kalam(
                                      color: priceColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                     backgroundImage:  AssetImage("assets/images/myprofile.jpeg"),
                                    ),
                                  ],
                                ),
                            Spacer(),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "momagdy755@gmail.com",
                      style: GoogleFonts.kalam(
                        color:isOpen? Colors.white: brownColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Center(child: Text
                    (
                    "01221805147",
                    style: GoogleFonts.kalam(
                      color:isOpen? Colors.white : brownColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),),

                  Spacer(),
                  BottomNavBar(isOpen: isOpen, visable: visable,index: 3,)

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
