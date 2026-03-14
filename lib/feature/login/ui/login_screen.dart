// feature/login/ui/login_screen.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// feature/login/ui/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/feature/image%20procesing/image_in.dart';
import 'package:grade_project/feature/login/logic/login_cubit.dart';
import 'package:grade_project/feature/login/ui/widgets/big_round_countainer.dart';
import 'package:grade_project/feature/login/ui/widgets/eschool_container.dart';
import 'package:grade_project/feature/login/ui/widgets/home_image.dart';
import 'package:grade_project/feature/login/ui/widgets/login_build_input.dart';
import 'package:grade_project/feature/login/ui/widgets/login_button.dart';
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
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
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
                BigRoundContainer(),

                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h),
                        EschoolContainer(),
                        SizedBox(height: 1.h),
                        LoginBuildInput(
                          controller: _emailController,
                          hint: 'student ID / School Email',
                          icon: Icons.badge_outlined,
                        ),
                        SizedBox(height: 2.h),
                        LoginBuildInput(
                          controller: _passwordController,
                          hint: 'password',
                          icon: Icons.lock,
                          obscure: true,
                        ),
                        SizedBox(height: 4.h),
                        LoginButton(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                HomeImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //   Widget buildInput({

  //   }) {
  //     return BuildInput();
  //   }
}
