import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/controllers/auth_controllers/auth_controller.dart';
import 'package:re_align/views/authentication/verify_email.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';
import 'package:re_align/widgets/custom_text_field.dart';
 // Make sure path is correct

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // TextEditingControllers to get user input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Get instance of AuthController
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx( // Use Obx to rebuild UI if isLoading changes
                () => Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        AppIcons.logoImage,
                        width: 150,
                      ),
                      const SizedBox(height: 100),
                      customText(
                        text: "Create new account",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      customText(
                        text: "What’s your email?*",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        controller: _emailController,
                        hint: "Username/Email",
                        borderColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      customText(
                        text: "Set a strong password*",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        controller: _passwordController,
                        hint: "Password",
                        borderColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      customText(
                        text: "Confirm new password*",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        hint: "Confirm Password",
                        borderColor: Colors.white,
                      ),
                      const SizedBox(height: 32),

                      // Button
                      CustomButton(
                        text: "Send OTP",
                        onPressed: _authController.isLoading.value
                            ? null
                            : () async {
                          // Basic validations
                          if(_emailController.text.isEmpty) {
                            Get.snackbar("Error", "Email is required");
                            return;
                          }
                          if(_passwordController.text != _confirmPasswordController.text) {
                            Get.snackbar("Error", "Passwords do not match");
                            return;
                          }
                          // Call sendOtp from controller
                          await _authController.sendOtp(_emailController.text);

                          // if isOtpSent is true, go to VerifyEmail
                          if(_authController.isOtpSent.value) {
                            // Pass data to next screen if needed
                            Get.to(() => const VerifyEmail(isReset: false));
                          }
                        },
                      ),

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
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
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

                      const SizedBox(height: 50),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                            text: "Don’t have an account? ",
                            fontSize: 18,
                          ),
                          customText(
                            text: "SignIn",
                            fontSize: 18,
                            txtDecoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Show loader
                if (_authController.isLoading.value)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
