// feature/quistions/ui/questions2ans_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/welcome_back_screen.dart';
import 'package:grade_project/feature/quistions/ui/widgets/answer_button.dart';
import 'package:grade_project/feature/quistions/ui/widgets/qustion_button.dart';
import 'package:grade_project/feature/quistions/ui/widgets/qustion_text.dart';
import 'package:grade_project/feature/quistions/ui/widgets/slider_row.dart';
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
                  SliderRow(progress: _progress, widget: widget),
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
                  QustionText(widget: widget),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnswerButton(
                        label: 'YES',
                        isSelected: _selectedAnswer == true,
                        onTap: () => _selectAnswer(true),
                      ),
                      AnswerButton(
                        label: 'No',
                        isSelected: _selectedAnswer == false,
                        onTap: () => _selectAnswer(false),
                      ),
                    ],
                  ),
                  SizedBox(height: 29.h),
                  QustionButton(widget: widget),
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
