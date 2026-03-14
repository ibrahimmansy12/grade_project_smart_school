// feature/risk/ui/risk_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/feature/notification/ui/notification_screen.dart';
import 'package:grade_project/feature/report%20with%20date/report2_screen.dart';
import 'package:grade_project/feature/report/ui/report_screen.dart';
import 'package:grade_project/feature/risk/ui/widgets/risk_card.dart';
import 'package:grade_project/feature/setting/ui/setting_screen.dart';
import 'package:sizer/sizer.dart';

class RiskScreen extends StatelessWidget {
  const RiskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
        onPressed: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  ),
        child: Icon(Icons.keyboard_double_arrow_right_outlined, size: 20.sp),
      ),
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Sarah,',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 0.6.h),
                          Text(
                            'emily861@example.com',
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Report2Screen(),
                            ),
                          );
                    },
                      child: Icon(
                        Icons.notifications,
                        size: 26.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                // SizedBox(height: 2.h),

                // Risk card
                RiskCard(data: const [6, 7.2, 6.8, 6.0, 5.4]),

                SizedBox(height: 2.h),

                // Alerts card (label inside container)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 3.2.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.4.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.w,
                        offset: Offset(0, 1.2.w),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alerts',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.black26,
                            size: 22.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.4.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.4.w),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.orange,
                              size: 5.w,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Repeated aggression detected',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      'Friday',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Emily was involved in repeated aggressive behavior in class over last few days.',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black54,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 2.h),

                // Contact card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.w,
                        offset: Offset(0, 1.w),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // SizedBox(width: 3.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 6.w,
                                  backgroundImage: null,
                                  backgroundColor: Colors.grey.shade300,
                                  child: Icon(
                                    Icons.person,
                                    size: 6.w,
                                    color: Colors.white,
                                  ),
                                ),
                                horezontalSpace(4),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. JTAME Smith',
                                      style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 0.6.h),
                                    Text(
                                      'School Counselor',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            verticalSpace(1),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 6.w,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  '+1 (1233) 456-7890',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                            verticalSpace(0.8),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 6.w,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  'counselor@example.com',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
