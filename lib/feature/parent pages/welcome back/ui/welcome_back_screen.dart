// feature/parent pages/welcome back/ui/welcome_back_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/home_select/home_select_screen.dart';
import 'package:sizer/sizer.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({
    super.key,
    this.onSettingsTap,
    this.onStartSurveyTap,
    this.onSupportTap,
    this.onContactTap,
  });

  final VoidCallback? onSettingsTap;
  final VoidCallback? onStartSurveyTap;
  final VoidCallback? onSupportTap;
  final VoidCallback? onContactTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                child: SizedBox(
                  height: 20.h,
                  child: CustomPaint(painter: _CircuitPainter()),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(4.w, 3.h, 4.w, 22.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeBackRow(onSettingsTap: onSettingsTap),
                  SizedBox(height: 23.h),
                  StartServayContainer(onStartSurveyTap:  () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const HomeSelectScreen()),
        ),),
                  SizedBox(height: 8.5.h),
                  SupportContainer(onSupportTap: onSupportTap, onContactTap: onContactTap),
                  SizedBox(height: 4.h),
                  DataPrivateContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPrivateContainer extends StatelessWidget {
  const DataPrivateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.8.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 9.5.w,
                height: 9.5.w,
                decoration: const BoxDecoration(
                  //color: Color(0xFF2F6A9B),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified_user,
                  color: Color(0xFF2F6A9B),
                  size: 23.5.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  'Your data is private\nand securely protected',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF23252B),
                    height: 1.35,
                  ),
                ),
              ),
              Icon(
                Icons.shield,
                color:  Colors.white,
                size: 31.sp,
              ),
            ],
          ),
          SizedBox(height: 1.1.h),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
    );
  }
}

class StartServayContainer extends StatelessWidget {
  const StartServayContainer({
    super.key,
    required this.onStartSurveyTap,
  });

  final VoidCallback? onStartSurveyTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7.h, bottom: 4.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 4.2.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 14.sp,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: GestureDetector(
          onTap: onStartSurveyTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 1.4.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              gradient: const LinearGradient(
                colors: [Color(0xFF5E9ED0), Color(0xFF2A6797)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              'Start the survey',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SupportContainer extends StatelessWidget {
  const SupportContainer({
    super.key,
    required this.onSupportTap,
    required this.onContactTap,
  });

  final VoidCallback? onSupportTap;
  final VoidCallback? onContactTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEFF1),
        borderRadius: BorderRadius.circular(14.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            dense: true,
            onTap: onSupportTap,
            title: Text(
              'Support',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF23252B),
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: const Color(0xFF73777E),
              size: 21.sp,
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.20),
          ),
          InkWell(
            onTap: onContactTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 1.3.h,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 18.sp,
                    color: const Color(0xFF2F6A9B),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'contact us',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF23252B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeBackRow extends StatelessWidget {
  const WelcomeBackRow({super.key, required this.onSettingsTap});

  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'welcome back!',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF14161A),
                ),
              ),
              SizedBox(height: 0.6.h),
              Text(
                'Ready to check in ?',
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF82868E),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onSettingsTap,
          child: Padding(
            padding: EdgeInsets.all(0.8.h),
            child: Column(
              children: [
                Image.asset("assets/Vector.png"),
                SizedBox(height: 0.35.h),
                Text(
                  'settings',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xFF6E737A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CircuitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBDD4EA)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = const Color(0xFFBDD4EA)
      ..style = PaintingStyle.fill;

    final p1 = Path()
      ..moveTo(0, size.height * 0.25)
      ..lineTo(size.width * 0.18, size.height * 0.25)
      ..lineTo(size.width * 0.18, size.height * 0.75)
      ..lineTo(size.width * 0.33, size.height * 0.75)
      ..lineTo(size.width * 0.33, size.height * 0.42)
      ..lineTo(size.width * 0.48, size.height * 0.42)
      ..lineTo(size.width * 0.48, size.height * 0.9);

    final p2 = Path()
      ..moveTo(size.width * 0.08, size.height * 0.95)
      ..lineTo(size.width * 0.08, size.height * 0.55)
      ..lineTo(size.width * 0.25, size.height * 0.55)
      ..lineTo(size.width * 0.25, size.height * 0.12)
      ..lineTo(size.width * 0.58, size.height * 0.12)
      ..lineTo(size.width * 0.58, size.height * 0.58)
      ..lineTo(size.width * 0.85, size.height * 0.58);

    final p3 = Path()
      ..moveTo(size.width * 0.62, size.height * 0.95)
      ..lineTo(size.width * 0.62, size.height * 0.36)
      ..lineTo(size.width * 0.77, size.height * 0.36)
      ..lineTo(size.width * 0.77, size.height * 0.16)
      ..lineTo(size.width, size.height * 0.16);

    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
    canvas.drawPath(p3, paint);

    final dots = [
      Offset(size.width * 0.18, size.height * 0.25),
      Offset(size.width * 0.33, size.height * 0.75),
      Offset(size.width * 0.48, size.height * 0.9),
      Offset(size.width * 0.25, size.height * 0.55),
      Offset(size.width * 0.58, size.height * 0.58),
      Offset(size.width * 0.77, size.height * 0.16),
      Offset(size.width * 0.85, size.height * 0.58),
    ];

    for (final dot in dots) {
      canvas.drawCircle(dot, 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
