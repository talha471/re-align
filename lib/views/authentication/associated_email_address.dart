import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/views/authentication/verify_email.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';
import 'package:re_align/widgets/custom_text_field.dart';

class AssociatedEmailAddress extends StatefulWidget {
  const AssociatedEmailAddress({super.key});

  @override
  State<AssociatedEmailAddress> createState() => _AssociatedEmailAddressState();
}

class _AssociatedEmailAddressState extends State<AssociatedEmailAddress> {

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
              GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),                     const SizedBox(
                height: 20,
              ),
              Image.asset(
                  width: 150,
                  AppIcons.logoImage),
              Spacer(),
              customText(
                text: "Enter the Email Address associated to your account",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
              const SizedBox(height: 20,),
              const CustomTextField(
                hint: "Username/Email",
                borderColor: Colors.white,
              ),
              const SizedBox(height: 50,),
              CustomButton(text: "Send OTP",
                  onPressed: (){
                    Get.to(() => const VerifyEmail());

                  }),
              const SizedBox(height: 10,),
              Center(
                child: TextButton(onPressed: (){

                }, child: customText(
                    text: "Return to Login",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),),
              )

            ],
          ),
        ),
      ),
    );
  }
}