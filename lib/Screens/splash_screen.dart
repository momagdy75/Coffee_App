import 'package:coffee_hub/Screens/home_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Future.delayed(Duration(seconds: 3),(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      return HomeScreen();
    }), (route) => false);
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),fit:BoxFit.cover
                )
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/appicon.png")
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }
}
