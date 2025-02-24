import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/color_constants.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/views/authentication/intro_screens/check_in_screen.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';
import 'package:re_align/widgets/custom_text_field.dart';

class HealthAndLifestyle2 extends StatefulWidget {
  const HealthAndLifestyle2({super.key});

  @override
  State<HealthAndLifestyle2> createState() => _HealthAndLifestyle2State();
}

class _HealthAndLifestyle2State extends State<HealthAndLifestyle2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),                   const SizedBox(height: 30,),
              customText(
                  text: "Health and Lifestyle Data (optional)",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black
              ),
              const SizedBox(height: 25,),
              customText(
                  text: "Would you like to share a bit about your health and lifestyle? This helps me personalize your journey",
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
              const SizedBox(height: 10,),
              const CustomTextField(
                hint: "Type here...",
                minLines: 3,
                maxLines: 3,
                borderColor: Colors.white,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: customText(
                        text: "Would you like to connect your device for a more tailored experience?",
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),
                  ),
                  Switch(value: true,
                    onChanged: (rf){},
                    activeTrackColor: Colors.white,
                    activeColor: ColorConstants.primaryColor,
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient( 
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      const Color(0xFF37648C).withOpacity(0.5), // Top color
                      const Color(0xFFEAEDF6).withOpacity(0.5), // Bottom color
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.apple),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: customText(
                        text: "Connect Apple Watch",
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      const Color(0xFF37648C).withOpacity(0.5), // Top color
                      const Color(0xFFEAEDF6).withOpacity(0.5), // Bottom color
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.fitbit),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: customText(
                          text: "Connect Fitbit Watch",
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),





              const Spacer(),
              const SizedBox(width: 30,),
              CustomButton(
                  text: "Continue",
                  onPressed: (){
                    Get.to(() => const CheckInScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}