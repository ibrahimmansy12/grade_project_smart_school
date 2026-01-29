// feature/welcome back/ui/welcome_back.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/welcome%20back/ui/welcome%20back2/welcome_back2.dart';
import 'package:sizer/sizer.dart';

class WelcomeBackPage extends StatelessWidget {
  const WelcomeBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 22.sp,
                      color: Colors.black87,
                    ),
                    Icon(
                      Icons.notifications_none,
                      size: 22.sp,
                      color: Colors.blue.shade400,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
          
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Ready to check in?',
                  style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                ),
          
                SizedBox(height: 4.h),
          
                // Primary card with CTA
                _roundedCard(
                  child: Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2E6EB3),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 2.2.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.sp),
                        ),
                        elevation: 8,
                        shadowColor: Colors.black12,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeBack2Page(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.check_circle,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Take today's check-in",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 4.h),
          
                // Mood streak card
                _roundedCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hang mood streak',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 3.w,
                                height: 3.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Container(
                                width: 3.w,
                                height: 3.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _moodButton(
                            Colors.green.shade100,
                            Icons.sentiment_very_satisfied,
                            30.sp,
                          ),
                          _moodButton(
                            Colors.lightGreen.shade100,
                            Icons.sentiment_satisfied,
                            30.sp,
                          ),
                          _moodButton(
                            Colors.yellow.shade100,
                            Icons.sentiment_neutral,
                            30.sp,
                          ),
                          _addButton(),
                        ],
                      ),
                    ],
                  ),
                ),
          
               // Spacer(),
          
                // Bottom info card with page indicator
                _roundedCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            color: Colors.blue.shade200,
                            size: 20.sp,
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            child: Text(
                              'Your data is private and securely protected.',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue.shade200,
                            size: 18.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 2.w,
                            height: 0.9.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            width: 2.w,
                            height: 0.9.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Container(
                            width: 2.w,
                            height: 0.9.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundedCard({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _moodButton(Color bg, IconData icon, double size) {
    return Container(
      width: 14.w,
      height: 14.w,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Center(
        child: Icon(icon, color: Colors.black54, size: size),
      ),
    );
  }

  Widget _addButton() {
    return Container(
      width: 14.w,
      height: 14.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Icon(Icons.add, size: 24.sp, color: Colors.black54),
      ),
    );
  }
}
