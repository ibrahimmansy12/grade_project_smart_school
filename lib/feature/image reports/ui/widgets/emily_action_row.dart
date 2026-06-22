// feature/image reports/ui/widgets/emily_action_row.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// feature/image reports/ui/widgets/emily_action_row.dart

import 'package:flutter/material.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/discription_column.dart';
import 'package:grade_project/feature/image%20reports/ui/widgets/howtohelp_row.dart';
import 'package:grade_project/feature/report%20with%20date/widgets/report2_alert_card.dart';
import 'package:sizer/sizer.dart';

class EmilyActionCard extends StatelessWidget {
  const EmilyActionCard({Key? key, this.report}) : super(key: key);

  final ReportCardModel? report;

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
              color: const Color.fromARGB(255, 147, 139, 139),
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Text(
              report?.report.riskLevel ?? "low",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 1.5.h),
          // ImageContainer(),
          SizedBox(height: 2.h),
          const Divider(color: Color(0xFFB5B5B5), height: 1),
          Padding(
            padding: EdgeInsets.only(top: 1.6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status",
                  style: TextStyle(
                    color: const Color(0xFF191919),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  report?.report.status ?? "aproved",
                  style: TextStyle(
                    color: const Color(0xFF7A7A7A),
                    fontSize: 17.sp,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.8.h),
                Text(
                  "What should to Do",
                  style: TextStyle(
                    color: const Color(0xFF191919),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  report?.report.recomendation ?? "aproved",
                  style: TextStyle(
                    color: const Color(0xFF7A7A7A),
                    fontSize: 17.sp,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DescriptionColumn(),
                // SizedBox(height: 1.8.h),
                //  DurationColumn(),
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
