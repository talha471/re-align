import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/views/authentication/register_screen.dart';
import 'package:re_align/views/bottom_bar/main_bottom_bar.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';
import 'package:re_align/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _saveLoginDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Icon(Icons.arrow_back, color: Colors.white,),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                  width: 150,
                  AppIcons.logoImage),
              const SizedBox(height: 100,),
              customText(
                text: "Log into your account",
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black
              ),
              const SizedBox(
                height: 20,
              ),

              const CustomTextField(
                hint: "Username/Email",
              ),

              const SizedBox(
                height: 20,
              ),

              CustomTextField(
                hint: "Password",
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      text: "Forgot?  ",
                      color: Colors.black
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                   value: _saveLoginDetails,
                    onChanged: (value) {
                      setState(() {
                        _saveLoginDetails = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Save login details',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              CustomButton(text: "Login", onPressed: (){
               // Get.to(() => const AssociatedEmailAddress());
                Get.to(() => const HomeScreen());
              }),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Google button
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 58,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: SvgPicture.asset(AppIcons.google),

                        label: const Text(''),
                        onPressed: () {
                          // Handle Google sign-in
                        },
                      ),
                    ),
                  ),
                  // Apple button
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: 58,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.apple, size: 24),
                        label: const Text(''),
                        onPressed: () {
                          // Handle Apple sign-in
                        },
                      ),
                    ),
                  ),


                ],
              ),

              const SizedBox(
                height: 50,
              ),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black, // Text & icon color (Flutter 2.5+)
                    side: const BorderSide(color: Colors.black), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // Handle guest join
                  },
                  child: customText(
                    text: "Join as a Guest",
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                  )
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              GestureDetector(
                onTap: (){
                  Get.to(() => const RegisterScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    customText(
                      text: "Don’t have an account? ",
                      fontSize: 18
                    ),
                    customText(
                      text: "SignUp",
                      fontSize: 18,
                      decorationColor: Colors.black,
                      txtDecoration: TextDecoration.underline
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}