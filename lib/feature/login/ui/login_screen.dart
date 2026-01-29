// feature/login/ui/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/core/widgets/app_text_button.dart';
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
    // final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Builder(
        builder: (context) => BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginLoading) {
              // show loading dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else {
              // dismiss loading if present
              if (Navigator.canPop(context)) {
                try {
                  Navigator.of(context).pop();
                } catch (_) {}
              }

              if (state is LoginSuccess) {
                // navigate to ImageIn and replace the login screen
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
            backgroundColor: const Color(0xFFF4F6FA),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top illustration placeholder
                    // SizedBox(
                    //   height: 25.h,
                    //   child: Center(
                    //     child: Container(
                    //       width: 40.w,
                    //       height: 40.w,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(6.w),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.black.withOpacity(0.06),
                    //             blurRadius: 3.w,
                    //             offset: Offset(0, 1.2.w),
                    //           ),
                    //         ],
                    //       ),
                    //       child: Icon(
                    //         Icons.school,
                    //         size: 14.w,
                    //         color: const Color(0xFF4A86F0),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    verticalSpace(33),

                    // Credentials card
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 2.5.w,
                              offset: Offset(0, 1.2.w),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            LoginTextFormListTile(
                              emailController: _emailController,
                            ),
                            const Divider(height: 1),
                            LoginTextFormListTile(
                              hintText: 'Password',
                              iconData: const Icon(
                                Icons.lock_outline,
                                color: Colors.black45,
                              ),
                              emailController: _passwordController,
                            ),

                            // ListTile(
                            //   leading: const Icon(
                            //     Icons.lock_outline,
                            //     color: Colors.black45,
                            //   ),
                            //   title: TextFormField(
                            //     controller: _passwordController,
                            //     obscureText: true,
                            //     decoration: const InputDecoration(
                            //       border: InputBorder.none,
                            //       hintText: 'Password',
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),

                    verticalSpace(6),

                    // Login button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: SizedBox(
                        width: double.infinity,
                        height: 7.h,
                        child: MyTextButton(
                          buttonText: 'Login',
                          borderRadius: 6.w,
                          backGroundColor: const Color(0xFF4A86F0),
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                          onpressed: () {
                            final userName = _emailController.text.trim();
                            final password = _passwordController.text.trim();

                            context.read<LoginCubit>().login(
                              userName: userName,
                              password: password,
                            );
                          },
                        ),

                        //  ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: const Color(0xFF4A86F0),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(6.w),
                        //     ),
                        //     elevation: 6,
                        //   ),
                        //   child: Text(
                        //     'Login',
                        //     style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        //   ),
                        // ),
                      ),
                    ),

                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Color(0xFF6B8ACD),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    verticalSpace(2),
                    // or divider
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'or',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),

                    SizedBox(height: 2.h),

                    // Link Student card
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(2.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 14,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFe8f0ff),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.verified,
                                    color: Color(0xFF4A86F0),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'Link Student to Account',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter 6 digit code. from student',
                                filled: true,
                                fillColor: const Color(0xFFF7F9FC),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(2),
                    Row(
                      children: [
                        horezontalSpace(4.5),
                        Icon(
                          Icons.add_box_outlined,
                          color: Colors.black45,
                          size: 20.sp,
                        ),
                        horezontalSpace(3),
                        Text(
                          'A code was sent to the student\'s phone.',
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTextFormListTile extends StatelessWidget {
  const LoginTextFormListTile({
    super.key,
    required TextEditingController emailController,
    this.hintText,
    this.iconData,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String? hintText;
  final Icon? iconData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconData ?? Icon(Icons.email_outlined, color: Colors.black45),
      title: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? 'Email',
        ),
      ),
    );
  }
}
