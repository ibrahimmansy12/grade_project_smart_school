// feature/image reports/ui/image_reports_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/back_notification_row.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/check_date_row.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/emily_action_row.dart';
import 'package:grade_project/feature/thank%20you/thank%20you_screen.dart';
import 'package:sizer/sizer.dart';

class ImageReportsScreen extends StatelessWidget {
  const ImageReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.8.h),
              BackNotificationRow(),
              SizedBox(height: 0.7.h),
              Text(
                'Reports',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF101010),
                ),
              ),
              SizedBox(height: 3.h),
              CheckDateRow(),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [EmilyActionCard()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
