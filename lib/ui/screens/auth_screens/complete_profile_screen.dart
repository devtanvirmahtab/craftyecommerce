import 'package:craftyecommerce/ui/screens/navbar_screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/app_textfield_widget.dart';
import '../../widgets/appp_eleveted_button.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 35),
                SvgPicture.asset('assets/images/logo.svg',
                    width: 120, fit: BoxFit.scaleDown),
                const SizedBox(height: 14),
                Text(
                  "Complete Profile",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.65)),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Get started with your details",
                  style: TextStyle(color: Color(0xFFa6a6a6), letterSpacing: 0.5),
                ),
                const SizedBox(height: 16),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "First Name",
                ),
                const SizedBox(height: 16),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Last Name",
                ),
                const SizedBox(height: 16),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Mobile",
                ),
                const SizedBox(height: 16),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "City",
                ),
                const SizedBox(height: 16),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Shipping Address",
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                AppElevatedButton(
                  text: "Complete",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainBottomNavScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
