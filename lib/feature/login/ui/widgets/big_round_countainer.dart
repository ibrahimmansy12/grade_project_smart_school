// feature/login/ui/widgets/big_round_countainer.dart

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BigRoundContainer extends StatelessWidget {
  const BigRoundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: -10.h,
      bottom: 45.h,
      right: -2.h,
      left: -2.h,
      //  alignment: Alignment.topCenter,
      child: Container(
        height: 38.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFCFE1F4),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.w),
            bottomRight: Radius.circular(50.w),
          ),
        ),
      ),
    );
  }
}
