// feature/repeted/ui/repeted_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/core/widgets/app_text_button.dart';
import 'package:grade_project/feature/report/ui/report_screen.dart';
import 'package:sizer/sizer.dart';

class RepetedScreen extends StatelessWidget {
  const RepetedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Increased sizes: title ~ +8, headings and body larger
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                children: [
                  // InkWell(
                  //   onTap: () => Navigator.of(context).maybePop(),
                  //   child: Icon(
                  //     Icons.arrow_back,
                  //     size: 8.w,
                  //     color: Colors.black87,
                  //   ),
                  // ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Repeated aggression detected',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        verticalSpace(1),
                        Text(
                          'Friday',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 3.h),

              // Main white card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.w,
                        offset: Offset(0, 1.5.w),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 4.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section: What this means
                        Text(
                          'What this means',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Emily was involved in repeated aggressive behavior in class over the last few days. Signs of bullying, frequent disturbances, or conflicts were observed.',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),

                        SizedBox(height: 3.h),
                        Divider(color: Colors.grey.shade200, thickness: 1),
                        SizedBox(height: 2.h),

                        // Section: What you can do
                        Text(
                          'What you can do',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 2.h),

                        // Bullet items
                        _actionItem(
                          iconSize: 8.w,
                          text:
                              'Have a calm conversion with Emily to understand what\'s going on.',
                        ),
                        SizedBox(height: 2.h),
                        _actionItem(
                          iconSize: 8.w,
                          text: 'Talk to her teacher about the incidents.',
                        ),
                        SizedBox(height: 2.h),
                        _actionItem(
                          iconSize: 8.w,
                          text: 'Reach out the school counselor for advice.',
                        ),

                        Spacer(),

                        // Contact button (using MyTextButton)
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(2),
              MyTextButton(
                buttonhight: 8,
                buttonwidth: null,
                buttonText: 'Contact School',
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                onpressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportScreen(),
                            ),
                          );
                },
                borderRadius: 12.w,
                backGroundColor: const Color(0xFF4B88C6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionItem({required double iconSize, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            // color: Color(0xFFCEE6FF),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.info, color: Color(0xFF2B6FA6), size: 24.sp),
        ),
        horezontalSpace(2),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
