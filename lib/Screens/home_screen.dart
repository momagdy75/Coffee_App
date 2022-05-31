import 'package:coffee_hub/constant.dart';
import 'package:coffee_hub/Screens/location_screen.dart';

import 'package:coffee_hub/Screens/menu_screen.dart';
import 'package:coffee_hub/Screens/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static int index=0;

  @override
  State<HomeScreen> createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> {
  List<Widget>AppScreen=[
    MainHomeScreen(),LocationScreen(),MenuScreen(),ProfileScreen()
  ];





@override
  void initState() {
    super.initState();
  }

void updateScreen(int index){
    HomeScreen.index=index;
}


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              color: bgtwoColor,
              child: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 200.0,horizontal: 20),
                            child: Column(

                              children: [
                                BuildMenuItem(
                                    Title: "Home",
                                    icon:HomeScreen.index==0? SvgPicture.asset("assets/images/home.svg"):SvgPicture.asset("assets/images/homelight.svg"),
                                    function: () {
                                      setState(() {
                                        HomeScreen.index = 0;
                                      });
                                    }),
                                SizedBox(height: 20,),
                                BuildMenuItem(

                                    Title: "Location",
                                    icon: HomeScreen.index==1? SvgPicture.asset("assets/images/location.svg"):SvgPicture.asset("assets/images/locationlight.svg"),
                                    function: () {

                                      setState(() {
                                        HomeScreen.index = 1;
                                      });
                                    }),
                                SizedBox(height: 20,),
                                BuildMenuItem(
                                    Title: "Menu",
                                    icon:HomeScreen.index==2? SvgPicture.asset("assets/images/store.svg"):SvgPicture.asset("assets/images/storelight.svg"),
                                    function: () {
                                      setState(() {
                                        HomeScreen.index = 2;
                                      });
                                    }),
                                SizedBox(height: 20,),
                                BuildMenuItem(
                                    Title: "Profile",
                                    icon:HomeScreen.index==3? SvgPicture.asset("assets/images/profile.svg"):SvgPicture.asset("assets/images/profilelight.svg"),
                                    function: () {
                                      setState(() {
                                        HomeScreen.index = 3;
                                      });
                                    }),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),AppScreen[HomeScreen.index]
          ],
        )
    );
  }


  Widget BuildMenuItem({required String Title,
    required SvgPicture icon,
    required Function() function}) {
    return ListTile(
      leading: icon,
      iconColor: Colors.black,
      title: Text("$Title",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black)),
      onTap: function,
    );
  }
}
