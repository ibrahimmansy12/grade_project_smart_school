// feature/onpord/get_started_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/feature/sellect%20roll/ui/select_role_screen.dart';
import 'package:sizer/sizer.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key,});

  // final VoidCallback? onGetStarted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 0.w, left: 0.w, bottom: 0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 16),

                // const SizedBox(height: 24),
                Center(
                  child: Container(
                    height: 35.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                      // gradient: const LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [Color(0xFF4FC3A1), Color(0xFF4E8EC0)],
                      // ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          left: 0,
                          child: Image.asset(
                            "assets/onpord_back_image.jpg",
                            fit: BoxFit.cover,
                            opacity: const AlwaysStoppedAnimation(0.4),
                          ),
                        ),
                        BigRoundRectangle(),
                        Positioned(
                          top: 6.h,
                          right: 4.w,
                          left: 4.w,
                          child: Image.asset(
                            "assets/onpord_page.png",
                            fit: BoxFit.cover,
                            height: 40.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(4),
                Center(
                  child: Text(
                    'E - SCHOOL',

                    style: TextStyle(
                      fontSize: 32.px,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: const Color(0xFF1F189D),
                    ),
                  ),
                ),
                verticalSpace(4),

                Center(
                  child: SizedBox(
                    width: 80.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SelectRoleScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4E8EC0),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 4.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.sp),
                        ),
                      ),

                      child: Text(
                        'GET STARTED',
                        style: GoogleFonts.poppins(
                          fontSize: 26.px,
                          fontWeight: FontWeight.w600,
                          //  letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 8),
                Image.asset(
                  "assets/onpord_back_image.jpg",
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BigRoundRectangle extends StatelessWidget {
  const BigRoundRectangle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4E8EC0).withOpacity(0.1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.sp),
            bottomRight: Radius.circular(70.sp),
          ),
        ),
      ),
    );
  }
}
