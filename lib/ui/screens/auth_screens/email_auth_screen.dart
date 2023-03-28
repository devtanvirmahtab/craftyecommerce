import 'package:craftyecommerce/ui/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/app_textfield_widget.dart';
import '../../widgets/appp_eleveted_button.dart';
import 'verify_otp_screen.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
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
                  "Welcome Back",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.65)),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Please enter your email address",
                  style: TextStyle(color: Color(0xFFa6a6a6), letterSpacing: 0.5),
                ),
                const SizedBox(height: 16),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Enter your Email",
                ),
                const SizedBox(height: 16),
                AppElevatedButton(
                  text: "Next",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyOtpScreen()));
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




