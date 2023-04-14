import 'package:craftyecommerce/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';


main(){
    runApp(const CraftyBayApp());
}

class CraftyBayApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   const CraftyBayApp({Key? key}) : super(key: key);

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: CraftyBayApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

