// feature/login/ui/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grade_project/feature/image%20procesing/image_in.dart';
import 'package:grade_project/feature/login/logic/login_cubit.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Builder(
        builder: (context) => BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else {
              if (Navigator.canPop(context)) {
                try {
                  Navigator.of(context).pop();
                } catch (_) {}
              }

              if (state is LoginSuccess) {
                Navigator.of(
                  context,
                ).pushReplacement(MaterialPageRoute(builder: (_) => ImageIn()));
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned.fill(
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
                  ),

                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40.h),
                          Text(
                            'E - SCHOOL',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1F429E),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          _buildInput(
                            controller: _emailController,
                            hint: 'student ID / School Email',
                            icon: Icons.badge_outlined,
                          ),
                          SizedBox(height: 2.h),
                          _buildInput(
                            controller: _passwordController,
                            hint: 'password',
                            icon: Icons.lock,
                            obscure: true,
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: double.infinity,
                            height: 6.3.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6EA9D5), Color(0xFF3A6F9D)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                final userName = _emailController.text.trim();
                                final password = _passwordController.text
                                    .trim();

                                context.read<LoginCubit>().login(
                                  userName: userName,
                                  password: password,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SvgPicture.asset(
                        //  color: const Color(0xFF4C77A9),
                        'assets/svg/login_image.svg',
                        height: 30.h,
                        width: 50.w,
                        //  fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return Container(
      height: 7.2.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(fontSize: 16.sp, color: const Color(0xFF555555)),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 2.1.h),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16.sp, color: const Color(0xFF9A9A9A)),
          prefixIcon: Icon(icon, color: const Color(0xFF9A9A9A), size: 20.sp),
        ),
      ),
    );
  }
}
