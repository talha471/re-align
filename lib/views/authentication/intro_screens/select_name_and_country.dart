import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/health_and_lifestyle.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';
import 'package:re_align/widgets/custom_text_field.dart';
import '../../../widgets/custom_dropdown.dart';

class SelectNameAndCountry extends StatefulWidget {
  const SelectNameAndCountry({super.key});

  @override
  State<SelectNameAndCountry> createState() => _SelectNameAndCountryState();
}

class _SelectNameAndCountryState extends State<SelectNameAndCountry> {


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
                  text: "Let’s get to know each other! I’ll guide you through some quick questions.",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black
              ),
              const SizedBox(height: 25,),
              customText(
                text: "What name would you like me to call you by?*",
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
              const SizedBox(height: 10,),
              const CustomTextField(
                hint: "Full Name",
                borderColor: Colors.white,
              ),
              const SizedBox(height: 20,),
              customText(
                  text: "Where do you live? (optional)",
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
              const SizedBox(height: 10,),
              CustomDropdownField(
                label: null,
                hint: "Select your country",
                items: const ["USA", "Canada", "UK", "Australia"],
                value: "USA",
                borderColor: Colors.white,
                onChanged: (value) {
                  print("Selected: $value");
                },
              ),



              const Spacer(),
              const SizedBox(width: 30,),
              CustomButton(
                  text: "Continue",
                  onPressed: (){
                    Get.to(const HealthAndLifestyle());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}