// feature/setting/ui/setting_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/feature/image%20procesing/image_in.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool consent = true;
  bool parental = true;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 22.sp,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      'Settings & Consent',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),

                // Consent card
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _rowWithSwitch(
                        title: 'Consent',
                        value: consent,
                        onChanged: (v) => setState(() => consent = v),
                        titleStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                        height: 2.h,
                        thickness: 0.5,
                        color: Colors.grey.shade200,
                      ),
                      _rowWithSwitch(
                        title: 'Parental consent given',
                        subtitle:
                            'Your summaries will be shared with authorized parties.',
                        value: parental,
                        onChanged: (v) => setState(() => parental = v),
                        titleStyle: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        subtitleStyle: TextStyle(
                          fontSize: 16.5.sp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Review privacy policy',
                          style: TextStyle(
                            fontSize: 16.5.sp,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 2.h),

                // Notifications card
                _card(
                  child: _rowWithSwitch(
                    title: 'Notifications',
                    value: notifications,
                    onChanged: (v) => setState(() => notifications = v),
                    titleStyle: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 2.h),

                // Support card
                _card(
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Support',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 20.sp + 8,
                          color: Colors.black26,
                        ),
                      ),
                      Divider(
                        height: 0,
                        thickness: 0.5,
                        color: Colors.grey.shade200,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.0.w),
                              child: Icon(
                                Icons.email,
                                size: 20.sp,
                                color: Colors.black54,
                              ),
                            ),
                            horezontalSpace(1.5),
                            Text(
                              'Contact Us',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                      // ListTile(
                      //   contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                      //   leading: Padding(
                      //     padding: EdgeInsets.only(left: 1.0.w),
                      //     child: Icon(
                      //       Icons.email,
                      //       size: 20.sp + 8,
                      //       color: Colors.black54,
                      //     ),
                      //   ),
                      // title: Text(
                      //   'Contact Us',
                      //   style: TextStyle(fontSize: 18.sp),
                      // ),

                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ),

                SizedBox(height: 3.h),

                // Logout button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 35.w,
                        vertical: 2.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.sp),
                      ),
                      side: BorderSide(color: Colors.red.shade200),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImageIn()),
                      );
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18.sp + 8, color: Colors.red),
                    ),
                  ),
                ),

                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.sp),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 6)),
        ],
      ),
      child: child,
    );
  }

  Widget _rowWithSwitch({
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    titleStyle ??
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
              ),
              verticalSpace(2),
              if (subtitle != null) ...[
                SizedBox(height: 0.5.h),
                Text(
                  subtitle,
                  style:
                      subtitleStyle ??
                      TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
              ],
            ],
          ),
        ),
        Transform.scale(
          scale: 3.5.sp,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.blue.shade400,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
