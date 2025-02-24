import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/terms_and_condition.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class EmailVerifiedScreen extends StatefulWidget {
  const EmailVerifiedScreen({super.key});

  @override
  State<EmailVerifiedScreen> createState() => _EmailVerifiedScreenState();
}

class _EmailVerifiedScreenState extends State<EmailVerifiedScreen> {


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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white,)),                         Container(
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle, color: Colors.black,size: 20,),
                        customText(
                          text: " Email verified",
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(width: 30,)
                ],
              ),
              const SizedBox(height: 30,),
              customText(
                  text: "Hi, I’m Reva, your personal AI guide|",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white
              ),
              Spacer(),
              CustomButton(
                  text: "Continue",
                  backgroundColor: Colors.grey.shade600,
                  onPressed: (){
                    Get.to(() => const TermsAndCondition());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}