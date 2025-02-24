import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/views/authentication/login_screen.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "/welcome_screen";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.asset(AppIcons.logoImage),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    customText(
                        text: "The All-in-One AI for Self-Inquiry, Neural Rewiring, and Authentic Transformation.",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center
                    ),

                    const SizedBox(height: 20),
                    CustomButton(text: "Get Started",
                        onPressed: (){
                          Get.to(() => const LoginScreen());
                        }
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
      )

    );
  }
}