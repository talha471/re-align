import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlanIndex = 0; // 0 => Yearly, 1 => Monthly



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
                   child: Icon(Icons.arrow_back, color: Colors.white,)),
              const SizedBox(height: 30,),
              customText(
                  text: "Your Journey Starts Now",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white
              ),
              const SizedBox(height: 10,),
              customText(
                  text: "Unlock tools, insights, and personalized sessions",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white
              ),
              const SizedBox(height: 25,),
              GestureDetector(
                onTap: () => setState(() => _selectedPlanIndex = 0),
                child: Stack(
                  clipBehavior: Clip.none, // allows label to overflow
                  children: [
                    // The main container for the yearly plan
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedPlanIndex == 0
                              ? Colors.white // highlight if selected
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side: Radio + plan title + subtext
                          Row(
                            children: [
                              Radio<int>(
                                value: 0,
                                groupValue: _selectedPlanIndex,
                                onChanged: (val) {
                                  setState(() => _selectedPlanIndex = val!);
                                },
                                activeColor: Colors.black,
                              ),
                              // Plan title + subtext
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                    text: 'Yearly',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 4),
                                  customText(
                                    text: 'Save 40%, 7-day free trial',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Right side: Price
                          customText(
                            text: '£119.99/year',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),

                    // The "VALUE FOR MONEY" label, positioned near the top-right
                    Positioned(
                      top: -12,  // negative offset to overlap container
                      right: 12, // distance from right side
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: customText(
                          text: 'VALUE FOR MONEY',
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // MONTHLY PLAN (with Radio)
              GestureDetector(
                onTap: () => setState(() => _selectedPlanIndex = 1),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _selectedPlanIndex == 1
                          ? Colors.white
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side: Radio + plan title + subtext
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: _selectedPlanIndex,
                            onChanged: (val) {
                              setState(() => _selectedPlanIndex = val!);
                            },
                            activeColor: Colors.black,
                          ),
                          // Plan title + subtext
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: 'Monthly',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 4),
                              customText(
                                text: 'Save 40%, 7-day free trial',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Right side: Price
                      customText(
                        text: '£14.99/month',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),




              const Spacer(),
              const SizedBox(width: 30,),
              CustomButton(
                  text: "Continue",
                  onPressed: (){
                   // Get.to(() => const HealthAndLifestyle2());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}