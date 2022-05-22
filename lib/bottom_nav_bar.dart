import 'package:coffee_hub/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.isOpen,
    required this.visable,
    required this.index
  }) : super(key: key);

  final bool isOpen;
  final bool visable;
  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 850),
      width: widget.isOpen? 0 : MediaQuery.of(context).size.width,
      height: widget.isOpen? 0 : 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft:Radius.circular(50) ),
          color: Colors.white
      ),

      child: Visibility(
        visible: widget.visable,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
                HomeScreenState().updateScreen(0);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }), (route) => false);
            },icon: widget.index==0? SvgPicture.asset("assets/images/home.svg") : SvgPicture.asset("assets/images/homelight.svg")),
            IconButton(onPressed: (){
                HomeScreenState().updateScreen(1);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }), (route) => false);
            }, icon: widget.index==1? SvgPicture.asset("assets/images/location.svg"):SvgPicture.asset("assets/images/locationlight.svg")),
            IconButton(onPressed: (){
              HomeScreenState().updateScreen(2);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                return HomeScreen();
              }), (route) => false);
            }, icon:widget.index==2? SvgPicture.asset("assets/images/store.svg"):SvgPicture.asset("assets/images/storelight.svg")),
            IconButton(onPressed: (){
              HomeScreenState().updateScreen(3);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                return HomeScreen();
              }), (route) => false);
            }, icon:widget.index==3? SvgPicture.asset("assets/images/profile.svg"):SvgPicture.asset("assets/images/profilelight.svg")),


          ],
        ),
      ),
    );
  }
}