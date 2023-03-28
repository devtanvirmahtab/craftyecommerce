  import 'package:craftyecommerce/ui/screens/navbar_screens/main_bottom_nav_screen.dart';
import 'package:craftyecommerce/ui/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/screens/auth_screens/email_auth_screen.dart';

main(){
    runApp(const CraftyBayApp());
}

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

