// feature/quistions/ui/questions2ans_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/welcome_back_screen.dart';
import 'package:sizer/sizer.dart';

class QuestionsScreen2ans extends StatefulWidget {
  const QuestionsScreen2ans({
    super.key,
    this.currentStep = 1,
    this.totalSteps = 17,
    this.question =
        'Would you be interested in participating in the interviews?',
    this.onNextTap,
    this.onAnswerChanged,
  });

  final int currentStep;
  final int totalSteps;
  final String question;
  final VoidCallback? onNextTap;
  final ValueChanged<bool>? onAnswerChanged;

  @override
  State<QuestionsScreen2ans> createState() => _QuestionsScreen2ansState();
}

class _QuestionsScreen2ansState extends State<QuestionsScreen2ans> {
  bool? _selectedAnswer;

  double get _progress {
    if (widget.totalSteps <= 0) {
      return 0;
    }
    return (widget.currentStep / widget.totalSteps).clamp(0, 1).toDouble();
  }

  void _selectAnswer(bool value) {
    setState(() {
      _selectedAnswer = value;
    });
    widget.onAnswerChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(6.w, 2.2.h, 6.w, 19.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 0.95.h,
                            color: const Color(0xFFD0D0D0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: _progress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2F6A9B),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '${widget.currentStep} of ${widget.totalSteps}',
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF23252B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.2.h),
                  Text(
                    'Q.) ${widget.currentStep}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF23252B),
                    ),
                  ),
                  SizedBox(height: 3.3.h),
                  Text(
                    widget.question,
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF23252B),
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _AnswerButton(
                        label: 'YES',
                        isSelected: _selectedAnswer == true,
                        onTap: () => _selectAnswer(true),
                      ),
                      _AnswerButton(
                        label: 'No',
                        isSelected: _selectedAnswer == false,
                        onTap: () => _selectAnswer(false),
                      ),
                    ],
                  ),
                  SizedBox(height: 29.h),
                  Center(
                    child: GestureDetector(
                      onTap: widget.onNextTap,
                      child: Container(
                        width: 35.w,
                        padding: EdgeInsets.symmetric(vertical: 1.2.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.sp),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF9EC1DE), Color(0xFF6D9EC4)],
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
                          'NEXT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 1.h,
              right: 1.h,
              bottom: 0,
              child: DataPrivateContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 30.w,
        padding: EdgeInsets.symmetric(vertical: 1.35.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE7F0F8) : const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: isSelected ? const Color(0xFF5E9ED0) : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF2F6A9B),
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 1.8.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.3.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.verified_user,
                  color: const Color(0xFF2F6A9B),
                  size: 21.sp,
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Text(
                    'Your data is private\nand securely protected',
                    style: TextStyle(
                      fontSize: 11.8.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF23252B),
                      height: 1.3,
                    ),
                  ),
                ),
                Icon(Icons.shield, color: const Color(0xFF8A8D90), size: 26.sp),
              ],
            ),
            SizedBox(height: 1.05.h),
            Divider(height: 1, color: Colors.black.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}
