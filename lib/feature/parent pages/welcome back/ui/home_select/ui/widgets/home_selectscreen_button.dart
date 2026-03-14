// feature/parent pages/welcome back/ui/home_select/ui/widgets/home_selectscreen_button.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/home_select/ui/home_select_screen.dart';
import 'package:grade_project/feature/quistions/ui/questions2ans_screen.dart';
import 'package:grade_project/feature/repeted/ui/repeted_screen.dart';
import 'package:sizer/sizer.dart';

class HomeSelectScreenButton extends StatelessWidget {
  const HomeSelectScreenButton({
    super.key,
    required this.selectedRole,
    required this.widget,
  });

  final String? selectedRole;
  final HomeSelectScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                                  builder: (_) => RepetedScreen(),
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
    );
  }
}
