// feature/welcome back/ui/welcome back2/welcom3/welcome3_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/repeted/ui/repeted_screen.dart';
import 'package:sizer/sizer.dart';

class Welcome3Screen extends StatelessWidget {
  const Welcome3Screen({super.key});

  Widget _checkItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 3.w),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Row(
        children: [
          Container(
            width: 6.5.w,
            height: 6.5.w,
            decoration: BoxDecoration(
              color: Color(0xFF2E6EB3),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.white, size: 18.sp),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18.sp, color: Color(0xFF11223A)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       floatingActionButton:
    FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RepetedScreen()),
      ),
      child: Icon(Icons.keyboard_double_arrow_right_outlined, size: 20.sp),
    ),
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints.tight(Size(8.w, 8.w)),
                icon: Icon(
                  Icons.arrow_back,
                  size: 18.sp,
                  color: Colors.black87,
                ),
                onPressed: () => Navigator.of(context).maybePop(),
              ),

              SizedBox(height: 2.h),

              Center(
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    Text(
                      'Thank you!',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF11223A),
                      ),
                    ),
                    SizedBox(height: 3.h),

                    // Illustration placeholder
                    Container(
                      width: 40.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => RepetedScreen(),
                          //   ),
                          // );
                        },
                        child: Center(
                          child: Icon(
                            Icons.school,
                            size: 36.sp,
                            color: Color(0xFF2E6EB3),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your check-in has been submitted',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF11223A),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            'We\'ll let the counselor know if you need support.\nYour answers are private and secure.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 3.h),

                    // Checklist card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _checkItem('Take a deep breath'),
                          SizedBox(height: 1.2.h),
                          _checkItem('Stretch for a minute'),
                          SizedBox(height: 1.2.h),
                          _checkItem('Focus on something calming'),
                        ],
                      ),
                    ),

                    SizedBox(height: 3.h),

                    // Page indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 2.w,
                          height: 0.6.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          width: 2.w,
                          height: 0.6.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          width: 2.w,
                          height: 0.6.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(6.sp),
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
    );
  }
}
