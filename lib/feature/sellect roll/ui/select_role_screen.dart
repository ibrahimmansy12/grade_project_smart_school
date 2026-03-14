// feature/sellect roll/ui/select_role_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/feature/login/ui/login_screen.dart';
import 'package:grade_project/feature/sellect%20roll/ui/widgets/role_card.dart';
import 'package:sizer/sizer.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key, this.onNext});

  final VoidCallback? onNext;

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0.25,
                child: Image.asset(
                  'assets/onpord_back_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(6)
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
                ,  SizedBox(height: 1.2.h),
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
                  Row(
                    children: [
                      Expanded(
                        child: RoleCard(
                          // label: 'student',
                          image: 'assets/student_image.png',
                          selected: selectedRole == 'student',
                          onTap: () {
                            setState(() {
                              selectedRole = 'student';
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: RoleCard(
                          // label: 'parent',
                          image: 'assets/parent_image.png',
                          selected: selectedRole == 'parent',
                          onTap: () {
                            setState(() {
                              selectedRole = 'parent';
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
                          : (widget.onNext ?? () {Navigator.of( context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));}),
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
