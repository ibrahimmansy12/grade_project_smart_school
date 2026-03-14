// feature/parent pages/welcome back/ui/home_select/home_select_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/welcome_back_screen.dart';
import 'package:grade_project/feature/quistions/ui/questions2ans_screen.dart';
import 'package:grade_project/feature/repeted/ui/repeted_screen.dart';
import 'package:grade_project/feature/sellect%20roll/ui/widgets/role_card.dart';
import 'package:sizer/sizer.dart';

class HomeSelectScreen extends StatefulWidget {
  const HomeSelectScreen({super.key, this.onNext});

  final VoidCallback? onNext;

  @override
  State<HomeSelectScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<HomeSelectScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 0,
            //   child: Opacity(
            //     opacity: 0.25,
            //     child: Image.asset(
            //       'assets/onpord_back_image.jpg',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(6),
                  // IconButton(
                  //   padding: EdgeInsets.zero,
                  //   constraints: const BoxConstraints(),
                  //   onPressed: () => Navigator.of(context).maybePop(),
                  //   icon: Icon(
                  //     Icons.arrow_back,
                  //     size: 28.sp,
                  //     color: const Color(0xFF2C2C2C),
                  //   ),
                  // ),
                  SizedBox(height: 1.2.h),
                  Center(
                    child: Text(
                      'Select Role',
                      style: GoogleFonts.poppins(
                        fontSize: 26.px,
                        fontWeight: FontWeight.w600,
                        //  letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  verticalSpace(0.06.h),
                  Center(
                    child: Text(
                      'please select role to continue',
                      style: GoogleFonts.poppins(
                        fontSize: 13.px,
                        fontWeight: FontWeight.w600,
                        //  letterSpacing: 1,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.5.h),
                  Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: RoleCard(
                          label: 'student',
                          image: 'assets/home_selectscreen_overview.png',
                          selected: selectedRole == 'student',
                          onTap: () {
                            setState(() {
                              selectedRole = 'student';
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Stack(
                          children: [
                            RoleCard(
                              label: 'parent',
                              image: 'assets/home_selectscreen_report.png',
                              selected: selectedRole == 'parent',
                              onTap: () {
                                setState(() {
                                  selectedRole = 'parent';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: RoleCard(
                          label: 'student',
                          image: 'assets/home_selectscreen_settings.png',
                          selected: selectedRole == 'student',
                          onTap: () {
                            setState(() {
                              selectedRole = 'student';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedRole == null
                          ? null
                          : (widget.onNext ??
                                () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => QuestionsScreen2ans(
                                        onNextTap: () =>
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    RepetedScreen(),
                                              ),
                                            ),
                                      ),
                                    ),
                                  );
                                }),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: const Color(0xFF75ADD7),
                        backgroundColor: const Color(0xFF3F83B8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.sp),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 1.7.h),
                        elevation: 3,
                      ),
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.poppins(
                          fontSize: 26.px,
                          fontWeight: FontWeight.w600,
                          //  letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
