// feature/image reports/ui/widgets/emily_action_row.dart

import 'package:flutter/material.dart';
import 'package:grade_project/feature/image%20reports/ui/image_reports_screen.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/discription_column.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/duration_column.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/howtohelp_row.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/image_container.dart';
import 'package:sizer/sizer.dart';

class EmilyActionCard extends StatelessWidget {
  const EmilyActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.8.h),
      decoration: BoxDecoration(
        color: Color(0xFFFfffff),
        borderRadius: BorderRadius.circular(4.3.w),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Emily's ACTIONS",
            style: TextStyle(
              color: const Color(0xFF111111),
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 1.1.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.8.w, vertical: 0.4.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE11F27),
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Text(
              'High Risk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 1.5.h),
          ImageContainer(),
          SizedBox(height: 2.h),
          const Divider(color: Color(0xFFB5B5B5), height: 1),
          Padding(
            padding: EdgeInsets.only(top: 1.6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DescriptionColumn(),
                SizedBox(height: 1.8.h),
                DurationColumn(),
                SizedBox(height: 2.h),
                HowToHelpRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
