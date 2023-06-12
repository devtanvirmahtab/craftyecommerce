import 'package:craftyecommerce/ui/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../getx/auth_controller.dart';
import '../../widgets/appp_eleveted_button.dart';
import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String? email;
  const VerifyOtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  final TextEditingController _otpTEController = TextEditingController();


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
                  "Enter OTP Code",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.65)),
                ),
                const SizedBox(height: 8),
                const Text(
                  "A 4 digits number sent to your email",
                  style: TextStyle(color: Color(0xFFa6a6a6), letterSpacing: 0.5),
                ),
                const SizedBox(height: 16),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  controller: _otpTEController,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: AppColors.primaryColor
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {

                  },
                  onChanged: (value) {

                  },
                  beforeTextPaste: (text) {
                   return true;
                  }, appContext: context,
                ),
                const SizedBox(height: 16),
                GetBuilder<AuthController>(
                  builder: (authController){
                    if(authController.verifyOTPInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else {
                      return AppElevatedButton(
                        text: "Next",
                        onTap: () {

                          authController.verifyOTP(widget.email!, _otpTEController.text).then((value) {
                            if(value){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => CompleteProfileScreen()));
                            }else{

                            }
                          });


                        },
                      );
                    }
                  }
                ),
                const SizedBox(height: 20),
                RichText(text: TextSpan(
                  text:"This Code will expire in ",
                  style: const TextStyle(color: Color(0xFFa6a6a6), letterSpacing: 0.5),
                  children: [
                    TextSpan(
                      text: "120s",
                      style: TextStyle(
                        color: AppColors.primaryColor
                      )
                    )
                  ]
                )),
                const SizedBox(height: 16),
                TextButton(onPressed: (){}, child: const  Text("Resend Code"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
