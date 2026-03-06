// feature/thank you/thank you_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:sizer/sizer.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 2.h),
            height: 46.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 213, 232, 252),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.h),
                bottomRight: Radius.circular(60.h),
              ),
            ),
            child: _TopHeader(),
          ),
          verticalSpace(2.5),
          Expanded(
            child: Container(
              color: const Color.fromARGB(132, 255, 255, 255),

              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 6.4.w,
                  vertical: 2.2.h,
                ),
                child: const _ThankYouContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 7.h,
          left: -6.h,
          right: -6.h,
          bottom: 0,
          child: Container(
            width: double.infinity,
            //height: 4.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 213, 232, 252),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.h),
                bottomRight: Radius.circular(60.h),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 3.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: const Color(0xFF4A4A4A),
                    size: 30.sp,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 7.h,
              left: 0,
              right: 0,

              child: Column(
                children: [
                  SizedBox(height: 0.7.h),
                  Text(
                    'Thank you!',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF183048),
                    ),
                  ),
                  SizedBox(height: 1.4.h),
                  Image.asset(
                    'assets/onpord_home_new.png',
                    height: 27.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ThankYouContent extends StatelessWidget {
  const _ThankYouContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'your check-in has been\nsubmitted',
          style: TextStyle(
            color: const Color(0xFF111111),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        verticalSpace(0.2.h),
        Text(
          "we'll let the counselor know if you\nneed support",
          style: TextStyle(
            color: const Color(0xFF7F7F7F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
        ),
        verticalSpace(0.2.h),

        Text(
          'Your answers are private and secure',
          style: TextStyle(
            color: const Color(0xFF141414),
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalSpace(0.2.h),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFDBE3EA),
            borderRadius: BorderRadius.circular(4.w),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.10),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: const [
              _TipRow(text: 'Take a deep breathe'),
              Divider(height: 1, color: Color(0xFFB4BEC9)),
              _TipRow(text: 'Take a deep breathe'),
              Divider(height: 1, color: Color(0xFFB4BEC9)),
              _TipRow(text: 'Take a deep breathe'),
            ],
          ),
        ),
      ],
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.2.w, vertical: 1.3.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: const Color.fromARGB(235, 75, 135, 187), size: 18.sp),
          SizedBox(width: 5.w),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF1B1B1B),
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
