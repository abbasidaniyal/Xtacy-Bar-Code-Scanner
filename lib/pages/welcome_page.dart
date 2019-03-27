import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SplashScreen(
      seconds: 2,

      image: Image.asset("assets/logo.png"),

      
      title: Text("xtacy",textScaleFactor: 2,),
      backgroundColor: Colors.white,
      photoSize: 150,
      navigateAfterSeconds: HomePage(),
        
    );
  }
}
