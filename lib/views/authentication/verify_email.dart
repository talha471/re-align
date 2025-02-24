import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/views/authentication/intro_screens/email_verified_screen.dart';
import 'package:re_align/views/authentication/set_password.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class VerifyEmail extends StatefulWidget {
  final bool? isReset;
  const VerifyEmail({super.key, this.isReset = true});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

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
                  text: "Verify your Email",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
              const SizedBox(height: 20,),
              customText(
                  text: "We sent a code to your email j***a@reva.com",
                  fontSize: 14,
                  color: Colors.black
              ),
              const SizedBox(height: 10,),
              customText(
                  text: "Send to different email",
                  fontSize: 14,
                  color: Colors.black
              ),
              const SizedBox(height: 20,),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 70,
                  fieldWidth: 80,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  selectedColor: Colors.white,
                  borderWidth: 1.5,
                ),
                cursorColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
              const SizedBox(height: 50,),
              CustomButton(text: "Send OTP",
                  onPressed: (){
                 if(widget.isReset == false){
                   Get.to(() => const EmailVerifiedScreen());
                 }else{
                   Get.to(() => const SetPassword());
                 }

                  }),
              const SizedBox(height: 10,),
              const SizedBox(height: 20,),
              Center(
                child: customText(
                    text: "Didn’t receive the code? check your \nspam, or resend",
                    fontSize: 14,
                    color: Colors.black,
                    textAlign: TextAlign.center
                ),
              ),
              const SizedBox(height: 20,),

              Center(
                child: TextButton(onPressed: (){

                }, child: customText(
                    text: "Resend Code",
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