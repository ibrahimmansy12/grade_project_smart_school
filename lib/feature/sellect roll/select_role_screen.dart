import 'package:flutter/material.dart';
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
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28.sp,
                      color: const Color(0xFF2C2C2C),
                    ),
                  ),
                  SizedBox(height: 1.2.h),
                  Center(
                    child: Text(
                      'Select Role',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111111),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  Center(
                    child: Text(
                      'please select role to continue',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.5.h),
                  Row(
                    children: [
                      Expanded(
                        child: _RoleCard(
                          label: 'student',
                          icon: Icons.school_rounded,
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
                        child: _RoleCard(
                          label: 'parent',
                          icon: Icons.family_restroom_rounded,
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
                          : (widget.onNext ?? () {}),
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
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
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

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.sp),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.sp),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            border: Border.all(
              color: selected ? const Color(0xFF3F83B8) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 28.sp,
                backgroundColor: const Color(0xFFDDE5F3),
                child: Icon(icon, size: 30.sp, color: const Color(0xFF4C77A9)),
              ),
              SizedBox(height: 1.2.h),
              Text(
                label,
                style: TextStyle(
                  color: const Color(0xFF2F5F95),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
