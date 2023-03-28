import 'package:craftyecommerce/ui/screens/navbar_screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utiles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainBottomNavScreen()), (route) => false)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 120,
              fit: BoxFit.scaleDown
            ),
            const Spacer(),
            CircularProgressIndicator(color: AppColors.primaryColor),
            const SizedBox(height: 16,),
            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,letterSpacing: .6)),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
