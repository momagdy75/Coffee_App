
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Screens/item_screen.dart';
import 'constant.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.coffeeNames,
    required this.index,
    required this.isOpen,
  }) : super(key: key);

  final List<String> coffeeNames;
  final bool isOpen;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ItemScreen(index);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 17,left:25),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isOpen ? SvgPicture.asset("assets/images/${coffeeNames[index]}light.svg") :SvgPicture.asset("assets/images/${coffeeNames[index]}.svg")  ,
              Text(coffeeNames[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: isOpen? Colors.white : Colors.black),),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ItemScreen(index);
                }));
              }, icon: Icon(Icons.arrow_forward_ios,size: 16,color: btnColor,))
            ],
          ),
        ) ,
      ),
    );
  }
}