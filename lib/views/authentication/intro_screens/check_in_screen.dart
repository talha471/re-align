import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/color_constants.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/check_in_time.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {

  int _selectedIndex = 1;

  final List<String> _options = [
    'Once per day',
    'Twice per day (Recommended)',
    'Three times per day',
    'Not right now'
  ];

  void _onOptionSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  text: "How often would you like to check in?",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black
              ),

              const SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Expanded(
                child: Column(
                  children: List.generate(_options.length, (index) {
                    final isSelected = (index == _selectedIndex);
                    return GestureDetector(
                      onTap: () => _onOptionSelected(index),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? ColorConstants.primaryColor : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: isSelected ?
                            Colors.grey.shade300 : ColorConstants.primaryColor,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: customText(
                            text: _options[index],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),



              const Spacer(),
              const SizedBox(width: 30,),
              CustomButton(
                  text: "Continue",
                  onPressed: (){
                    Get.to(() => const CheckInTimeScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}