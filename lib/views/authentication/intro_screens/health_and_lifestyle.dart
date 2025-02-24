import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/color_constants.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/health_and_lifestyle2.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';
import 'package:re_align/widgets/custom_text_field.dart';

class HealthAndLifestyle extends StatefulWidget {
  const HealthAndLifestyle({super.key});

  @override
  State<HealthAndLifestyle> createState() => _HealthAndLifestyleState();
}

class _HealthAndLifestyleState extends State<HealthAndLifestyle> {


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
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),               const SizedBox(height: 30,),
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
                maxLines: 3,
                minLines: 3,
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




              const Spacer(),
              const SizedBox(width: 30,),
              CustomButton(
                  text: "Continue",
                  onPressed: (){
                    Get.to(() => HealthAndLifestyle2());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}