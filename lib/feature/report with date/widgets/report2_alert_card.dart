// feature/report with date/widgets/report2_alert_card.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/report%20with%20date/widgets/report2_models.dart';
import 'package:sizer/sizer.dart';

class Report2AlertCard extends StatelessWidget {
  const Report2AlertCard({super.key, required this.item});

  final ReportAlertItem item;

  @override
  Widget build(BuildContext context) {
    final (Color foreground, Color background) = _paletteFor(item.level);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.55.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F7),
        borderRadius: BorderRadius.circular(4.3.w),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(color: background, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Icon(
              Icons.priority_high_rounded,
              size: 14.2.sp,
              color: foreground,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              item.title,
              style: TextStyle(
                color: const Color(0xFF181818),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: const Color(0xFF787878),
            size: 22.sp,
          ),
        ],
      ),
    );
  }

  (Color, Color) _paletteFor(AlertLevel level) {
    switch (level) {
      case AlertLevel.warning:
        return (const Color(0xFFDE8C10), const Color(0xFFFFE8C2));
      case AlertLevel.neutral:
        return (const Color(0xFF7B7B7B), const Color(0xFFE4E4E4));
    }
  }
}
