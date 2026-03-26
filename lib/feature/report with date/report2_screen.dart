// feature/report with date/report2_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/extention.dart';
import 'package:grade_project/core/routing/routs.dart';
import 'package:grade_project/feature/report%20with%20date/widgets/report2_alert_card.dart';
import 'package:grade_project/feature/report%20with%20date/widgets/report2_header_section.dart';
import 'package:grade_project/feature/report%20with%20date/widgets/report2_models.dart';
import 'package:sizer/sizer.dart';

class Report2Screen extends StatelessWidget {
  const Report2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReportAlertItem> alerts = [
      const ReportAlertItem(
        title: 'Repeated aggression',
        level: AlertLevel.warning,
      ),
      const ReportAlertItem(
        title: 'Low engagement in class',
        level: AlertLevel.neutral,
      ),
      const ReportAlertItem(
        title: 'Sleeping in class',
        level: AlertLevel.neutral,
      ),
      const ReportAlertItem(
        title: 'Repeated aggression',
        level: AlertLevel.warning,
      ),
      const ReportAlertItem(
        title: 'Low engagement in class',
        level: AlertLevel.neutral,
      ),
      const ReportAlertItem(
        title: 'Sleeping in class',
        level: AlertLevel.neutral,
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(ERouts.imageReportsScreen),
        child: Icon(Icons.keyboard_double_arrow_right_outlined, size: 20.sp),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.8.h),
              const Report2HeaderSection(),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: alerts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 2.h),
                  itemBuilder: (context, index) =>
                      Report2AlertCard(item: alerts[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
