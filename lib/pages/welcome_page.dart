import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SplashScreen(
      seconds: 2,

      
      title: Text("xtacy",textScaleFactor: 3,),
      backgroundColor: Colors.white,
      photoSize: 150,
      navigateAfterSeconds: HomePage(),
        
    );
  }
}
