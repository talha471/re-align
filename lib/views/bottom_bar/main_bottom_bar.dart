import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:re_align/constants/icon_constants.dart';
import 'package:re_align/views/dashboard/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> widgetList = [
    const DashboardScreen(),
    const Center(child: Text("People Settings")),
    const Center(child: Text("Wallet")),
    const Center(child: Text("Wallet")),
    const Center(child: Text("Wallet")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widgetList[_selectedIndex],

      /// Bottom bar with elevation (shadow)
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // 1. Background with rounded top corners and shadow.
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: PhysicalModel(
              color: Colors.white,
              elevation: 8,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              clipBehavior: Clip.antiAlias, // Clips the white background to rounded shape.
              child: Container(
                height: 60,
              ),
            ),
          ),
          // 2. Navigation items row.
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(icon: AppIcons.bottom1, index: 0),
                  _buildNavItem(icon: AppIcons.bottom2, index: 1),
                  _buildNavItem(icon: AppIcons.bottom3, index: 2, isCenter: true),
                  _buildNavItem(icon: AppIcons.bottom4, index: 3),
                  _buildNavItem(icon: AppIcons.bottom5, index: 4),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }

  Widget _buildNavItem({
    required String icon,
    required int index,
    bool isCenter = false,
  }) {
    bool isSelected = (_selectedIndex == index);

    return InkWell(
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: SizedBox(
        width: 72,
        height: 60,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // The icon or circle background, as before
          SvgPicture.asset(icon,),

            // The indicator
            if (isSelected )
              Positioned(
                top: -5,
                left: 0,       // Align to the left edge of the parent
                right: 0,      // Align to the right edge of the parent
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xff547A9B),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
          ],
        ),
      ),

    );
  }
}
