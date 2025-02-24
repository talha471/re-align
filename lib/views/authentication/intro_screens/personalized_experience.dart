import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/select_name_and_country.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class PersonalizedExperience extends StatefulWidget {
  const PersonalizedExperience({super.key});

  @override
  State<PersonalizedExperience> createState() => _PersonalizedExperienceState();
}

class _PersonalizedExperienceState extends State<PersonalizedExperience> {


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
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),                     const SizedBox(height: 30,),
              customText(
                  text: "Let’s settle in and take a moment to prepare for a personalized experience. ",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black
              ),
              const SizedBox(height: 20,),

              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CustomButtonOutlined(
                        text: "Skip",
                        onPressed: (){

                        }),
                  ),

                  SizedBox(width: 30,),
                  Expanded(
                    child: CustomButton(
                        text: "Continue",
                        onPressed: (){
                        Get.to(() => const SelectNameAndCountry());
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}