// feature/parent pages/welcome back/ui/welcome_back_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/extention.dart';
import 'package:grade_project/core/routing/routs.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/widgets/circuit_painter.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/widgets/data_private_container.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/widgets/start_survey_container.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/widgets/support_container.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/widgets/welcome_back_row.dart';
import 'package:sizer/sizer.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({
    super.key,
    this.onSettingsTap,
    this.onStartSurveyTap,
    this.onSupportTap,
    this.onContactTap,
  });

  final VoidCallback? onSettingsTap;
  final VoidCallback? onStartSurveyTap;
  final VoidCallback? onSupportTap;
  final VoidCallback? onContactTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                child: SizedBox(
                  height: 20.h,
                  child: CustomPaint(painter: CircuitPainter()),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(4.w, 3.h, 4.w, 22.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeBackRow(onSettingsTap: onSettingsTap),
                  SizedBox(height: 23.h),
                  StartServayContainer(
                    onStartSurveyTap: () =>
                        context.pushNamed(ERouts.homeSelectScreen),
                  ),
                  SizedBox(height: 8.5.h),
                  SupportContainer(
                    onSupportTap: onSupportTap,
                    onContactTap: onContactTap,
                  ),
                  SizedBox(height: 4.h),
                  const DataPrivateContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
