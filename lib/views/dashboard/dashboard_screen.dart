import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/widgets/background_base.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  void _showCalendarDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return const CupertinoAlertDialog(
          // By default, CupertinoAlertDialog has a rounded, translucent background
          content: SizedBox(
            // Fix the size so it doesn’t overflow. Adjust as needed.
            width: 320,
            height: 400,
            child: CupertinoStyleCalendar(),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "Welcome back Jessia",
                      fontSize: 24,
                      color: Colors.white60,
                      fontWeight: FontWeight.w500
                    ),
                    GestureDetector(
                      onTap: (){
                        _showCalendarDialog(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(AppIcons.calendar),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                customText(
                  text: "It's good to see you again. \nWhat would you like to explore today?",
                  fontSize: 18,
                  color: Colors.white
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    container(
                      title: "Avg: ",
                      description: "68 BPM"
                    ),
                    const SizedBox(width: 10,),
                    container(
                        title: "Min: ",
                        description: "62 BPM"
                    ),
                    const SizedBox(width: 10,),
                    container(
                        title: "Max: ",
                        description: "71 BPM"
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
            
                Row(
                  children: [
            
                    container(
                        title: "Device: ",
                        description: "No Device Connected"
                    ),
                    const SizedBox(width: 10,),
                    container(
                        title: "I’m: ",
                        description: "Happy"
                    ),
                  ],
                ),
            
                const SizedBox(height: 16),
            
            
                customText(
                  text: "Start your day",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 16),
            
                // First item
                _buildBreathItem(),
                const SizedBox(height: 16),
            
                // Second item
                _buildBreathItem(),
                const SizedBox(height: 16),
            
                // Third item
                _buildBreathItem(),
                const SizedBox(height: 32),
            
                // Section title: "Evening Session"
                customText(
                  text: "Evening Session",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 16),
            
                // Items in Evening Session
                _buildBreathItem(),
                const SizedBox(height: 16),
                _buildBreathItem(),
                const SizedBox(height: 16),
                _buildBreathItem(),

                const SizedBox(height: 16),


                customText(
                  text: "Session History",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 16),
                _buildSessionItem(),
                const SizedBox(height: 16),
                _buildSessionItem(),

                const SizedBox(height: 70),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget container({String? title, String? description}){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customText(
            text: title,
            fontSize: 14
          ),

          customText(
              text: description,
              fontSize: 14,
              fontWeight: FontWeight.w700
          ),

        ],
      ),
    );
  }

  Widget _buildBreathItem() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(AppIcons.good),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white38, // Adjust color as needed
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                const SizedBox(width: 12),

                // Middle texts + arrow
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row: "4-3-8 Breath" + arrow
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "4-3-8 Breath",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            size: 30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // "5 min" rows
                      customText(
                        text: "5 min",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 4),
                      customText(
                        text: "5 min",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSessionItem() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white38, // Adjust color as needed
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(width: 12),

          // Middle texts + arrow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: "4-3-8 Breath" + arrow

                // "5 min" rows
                customText(
                  text: "1 hr ago",
                  fontSize: 14,
                  color: Colors.black,
                ),
                const SizedBox(height: 12),
                customText(
                  text: "I’m feeling",
                  fontSize: 16,
                  color: Colors.black,
                ),
                const SizedBox(height: 3),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "Uneasy",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class CupertinoStyleCalendar extends StatefulWidget {
  const CupertinoStyleCalendar({Key? key}) : super(key: key);

  @override
  _CupertinoStyleCalendarState createState() => _CupertinoStyleCalendarState();
}

class _CupertinoStyleCalendarState extends State<CupertinoStyleCalendar> {
  // Example: show June 2025
  final DateTime displayedMonth = DateTime(2025, 6);

  // Keep track of multiple selected dates
  final Set<DateTime> _selectedDates = {};

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _daysInMonth(displayedMonth);
    // Determine which weekday the first day is (Sunday=7, Monday=1, etc.)
    final firstWeekday = DateTime(displayedMonth.year, displayedMonth.month, 1).weekday;
    // We want Sunday to appear in the first column => offset=0 if Sunday=7
    final offset = (firstWeekday == 7) ? 0 : firstWeekday;

    return Material(
      color: Colors.white.withOpacity(0), // Transparent so Cupertino dialog shows through
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title: "Journals History"
          customText(
            text: "Journals History",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          // Month & Year (e.g. "June 2025")
          customText(
            text: _monthYearString(displayedMonth),
            fontSize: 16,
            color: Colors.black54,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Weekday labels row: SUN, MON, TUE, WED, THU, FRI, SAT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _weekdayLabel("SUN"),
              _weekdayLabel("MON"),
              _weekdayLabel("TUE"),
              _weekdayLabel("WED"),
              _weekdayLabel("THU"),
              _weekdayLabel("FRI"),
              _weekdayLabel("SAT"),
            ],
          ),
          const SizedBox(height: 8),

          // A grid of days (5-6 rows, 7 columns)
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              // No scrolling needed if it fits in the fixed height
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,           // 7 days across
                mainAxisSpacing: 8,         // vertical spacing between rows
                crossAxisSpacing: 8,        // horizontal spacing between columns
              ),
              itemCount: daysInMonth + offset,
              itemBuilder: (context, index) {
                // Empty cells before day 1
                if (index < offset) {
                  return const SizedBox.shrink();
                }

                final dayNumber = index - offset + 1;
                final date = DateTime(displayedMonth.year, displayedMonth.month, dayNumber);

                final bool isSelected = _selectedDates.any((d) =>
                d.year == date.year && d.month == date.month && d.day == date.day);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        // Deselect
                        _selectedDates.removeWhere((d) =>
                        d.year == date.year && d.month == date.month && d.day == date.day);
                      } else {
                        // Select
                        _selectedDates.add(date);
                      }
                    });
                  },
                  child: _buildDayCircle(dayNumber, isSelected),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Single weekday label widget
  Widget _weekdayLabel(String text) {
    return Expanded(
      child: Center(
        child: customText(
          text: text,
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Build the circle for a single day
  Widget _buildDayCircle(int dayNumber, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // Match the light gray background for unselected, white w/ border for selected
        color: isSelected ? Colors.white : Colors.grey.shade300,
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: Colors.black, width: 2)
            : null,
      ),
      child: customText(
        text: "$dayNumber",
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  int _daysInMonth(DateTime date) {
    final firstDayThisMonth = DateTime(date.year, date.month, 1);
    final firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  String _monthYearString(DateTime date) {
    final monthNames = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return "${monthNames[date.month - 1]} ${date.year}";
  }
}

