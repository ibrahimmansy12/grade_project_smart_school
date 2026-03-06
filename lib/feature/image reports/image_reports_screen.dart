// feature/image reports/image_reports_screen.dart
import 'package:flutter/material.dart';
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: const Color(0xFF4A4A4A),
                      size: 30.sp,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.notifications,
                    color: const Color(0xFF1F5F91),
                    size: 25.sp,
                  ),
                ],
              ),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.sp),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text(
                          'dd/mm/yyyy',
                          style: TextStyle(
                            color: const Color(0xFF8A8A8A),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 24.w,
                      height: 3.8.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A6695),
                        borderRadius: BorderRadius.circular(7.w),
                      ),
                      child: Text(
                        'check',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [_EmilyActionCard()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmilyActionCard extends StatelessWidget {
  const _EmilyActionCard();

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
          Container(
            padding: EdgeInsets.all(1.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4.3.w),
            ),
            // borderRadius: BorderRadius.circular(4.w),
            child: ClipRRect(
              child: Image.asset(
                'assets/onpord_page.png',
                height: 14.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: 14.h,
                    color: const Color(0xFFCFCFCF),
                    alignment: Alignment.center,
                    child: Text(
                      'img',
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 2.h),
          const Divider(color: Color(0xFFB5B5B5), height: 1),
          Padding(
            padding: EdgeInsets.only(top: 1.6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'description',
                  style: TextStyle(
                    color: const Color(0xFF191919),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 0.8.h),
                Text(
                  'emily was involved in repeated\n'
                  'aggressive behavior in class over\n'
                  'the last few days .signs of\n'
                  'bullying .frequent disturbances ,\n'
                  'or conflicts were observed',
                  style: TextStyle(
                    color: const Color(0xFF7A7A7A),
                    fontSize: 17.sp,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.8.h),
                Text(
                  'duration',
                  style: TextStyle(
                    color: const Color(0xFF191919),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 0.8.h),
                Text(
                  'time stamp',
                  style: TextStyle(
                    color: const Color(0xFF7A7A7A),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThankYouScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 31.w,
                        height: 3.7.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A6695),
                          borderRadius: BorderRadius.circular(7.w),
                        ),
                        child: Text(
                          'How to help',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
