import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/subscription_screen.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class CheckInTimeScreen extends StatefulWidget {
  const CheckInTimeScreen({super.key});

  @override
  State<CheckInTimeScreen> createState() => _CheckInTimeScreenState();
}

class _CheckInTimeScreenState extends State<CheckInTimeScreen> {
  DateTime _selectedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    9, // Hour
    0, // Minute
  );

  /// Shows the Cupertino time picker in a centered dialog
  void _showTimePicker() {
    showCupertinoDialog(
      context: context,
      builder: (_) {
        return Material(
          color: Colors.black54, // Dimmed background
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap around children
              children: [
                // White container with time picker
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 250, // Adjust as needed
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 30, // Increase font size here
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: _selectedTime,
                      use24hFormat: false,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          _selectedTime = newTime;
                        });
                      },
                    ),
                  ),
                ),
                // 20px gap between the time picker container and the button
                const SizedBox(height: 20),
                // Done button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    String timeString = DateFormat('h : mm a').format(_selectedTime);

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
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),              const SizedBox(height: 30,),
              customText(
                  text: "What time works best for your check-ins?",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 25,),
              GestureDetector(
                onTap: _showTimePicker,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color:
                      Colors.grey.shade300 ,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: "Morning",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:  Colors.black,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: timeString.toString(),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:  Colors.black,
                          ),
                          const Icon(Icons.edit),
                        ],
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
                    Get.to(() => const SubscriptionScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}