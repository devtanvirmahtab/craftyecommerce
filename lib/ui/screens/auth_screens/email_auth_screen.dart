
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../getx/auth_controller.dart';
import '../../widgets/app_textfield_widget.dart';
import '../../widgets/appp_eleveted_button.dart';
import 'verify_otp_screen.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {

  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    controller: _emailTEController,
                    hintText: "Enter your Email",
                  ),
                  const SizedBox(height: 16),
                  GetBuilder<AuthController>(
                    builder: (authController) {
                      if(authController.sendVerificationToEmailInProgress){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else {
                        return AppElevatedButton(
                          text: "Next",
                          onTap: () {
                            _authController.sendVerificationCodeToEmail(
                                _emailTEController.text.trim()).then((value) {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyOtpScreen(email: _emailTEController.text),),);
                            });
                          },
                        );
                      }
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




