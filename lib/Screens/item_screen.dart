import 'dart:ui';
import 'package:coffee_hub/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
class ItemScreen extends StatefulWidget {
  int index = 1;

  ItemScreen(this.index);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int counter = 1;
  List<String> coffeeNames = [
    "Espresso",
    "Cappuccino",
    "Macchiato",
    "Mocha",
    "Latte",
  ];

  List<int> coffeePrices = [
    19,
    16,
    14,
    10,
    13,
  ];
  int check = -1;
  int check2= -1;
  List<String> coffeeSizes = ["size1", "size2", "size3"];
  List<String> coffeeSugars = ["sugar1", "sugar2", "sugar3","sugar4"];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90.0),
                            child: Text(
                              coffeeNames[widget.index],
                              style: GoogleFonts.kalam(
                                  fontSize: widget.index == 1 ? 25 : 32,
                                  color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                          child: SvgPicture.asset(
                        "assets/images/${coffeeNames[widget.index]}.svg",
                        height: 100,
                      ))
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 12, right: 16, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          coffeeNames[widget.index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Container(
                          height: 28,
                          width: 31,
                          decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50))),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (counter > 1) {
                                    counter--;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "$counter",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 28,
                          width: 31,
                          decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "\$${counter * coffeePrices[widget.index]}",
                      style: TextStyle(
                          color: brownColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          height: 100,

                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: coffeeSizes.length,
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        check = index;
                                        print(check);
                                        print(index);
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),

                                      child: index == check
                                          ? SvgPicture.asset(
                                          "assets/images/${coffeeSizes[index]}.svg")
                                          : SvgPicture.asset(
                                          "assets/images/${coffeeSizes[index]}check.svg")
                                    ),
                                  )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sugar",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 500,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: coffeeSugars.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    check2 = index;
                                    print(check2);
                                    print(index);
                                  });
                                },
                                child: Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 16),

                                    child: index == check2
                                        ? SvgPicture.asset(
                                        "assets/images/${coffeeSugars[index]}.svg")
                                        : SvgPicture.asset(
                                        "assets/images/${coffeeSugars[index]}check.svg")
                                ),
                              )),
                        ),
                        Center(
                          child: Container(
                            width: 150,
                            child: ElevatedButton(onPressed: (){
                              Toast.show("Your purchase has been successfully completed",duration: 3);
                            },child: Text("Add to cart"),style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  btnColor),
                            ),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
