// feature/report with date/report2_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/feature/image%20reports/image_reports_screen.dart';
import 'package:grade_project/feature/notification/notification_screen.dart';
import 'package:sizer/sizer.dart';

class Report2Screen extends StatelessWidget {
  const Report2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ReportAlertItem> alerts = [
      const _ReportAlertItem(
        title: 'Repeated aggression',
        level: _AlertLevel.warning,
      ),
      const _ReportAlertItem(
        title: 'Low engagement in class',
        level: _AlertLevel.neutral,
      ),
      const _ReportAlertItem(
        title: 'Sleeping in class',
        level: _AlertLevel.neutral,
      ),
      const _ReportAlertItem(
        title: 'Repeated aggression',
        level: _AlertLevel.warning,
      ),
      const _ReportAlertItem(
        title: 'Low engagement in class',
        level: _AlertLevel.neutral,
      ),
      const _ReportAlertItem(
        title: 'Sleeping in class',
        level: _AlertLevel.neutral,
      ),
    ];

    return Scaffold(
       floatingActionButton:
    FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageReportsScreen()),
      ),
      child: Icon(Icons.keyboard_double_arrow_right_outlined, size: 20.sp),
    ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.8.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: const Color(0xFF4A4A4A),
                      size: 30.sp,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                    },
                    child: Icon(
                      Icons.notifications,
                      color: const Color(0xFF1F5F91),
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.7.h),
              Text(
                'Reports',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF101010),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(14.sp),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text(
                          'dd/mm/yyyy',
                          style: TextStyle(
                            color: const Color(0xFF8A8A8A),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 24.w,
                      height: 3.8.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A6695),
                        borderRadius: BorderRadius.circular(7.w),
                      ),
                      child: Text(
                        'check',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: alerts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 2.h),
                  itemBuilder: (context, index) =>
                      _ReportAlertCard(item: alerts[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReportAlertCard extends StatelessWidget {
  const _ReportAlertCard({required this.item});

  final _ReportAlertItem item;

  @override
  Widget build(BuildContext context) {
    final _AlertPalette palette = _paletteFor(item.level);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.55.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F7),
        borderRadius: BorderRadius.circular(4.3.w),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(
              color: palette.background,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.priority_high_rounded,
              size: 14.2.sp,
              color: palette.foreground,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              item.title,
              style: TextStyle(
                color: const Color(0xFF181818),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: const Color(0xFF787878),
            size: 22.sp,
          ),
        ],
      ),
    );
  }

  _AlertPalette _paletteFor(_AlertLevel level) {
    switch (level) {
      case _AlertLevel.warning:
        return const _AlertPalette(
          foreground: Color(0xFFDE8C10),
          background: Color(0xFFFFE8C2),
        );
      case _AlertLevel.neutral:
        return const _AlertPalette(
          foreground: Color(0xFF7B7B7B),
          background: Color(0xFFE4E4E4),
        );
    }
  }
}

class _ReportAlertItem {
  const _ReportAlertItem({required this.title, required this.level});

  final String title;
  final _AlertLevel level;
}

class _AlertPalette {
  const _AlertPalette({required this.foreground, required this.background});

  final Color foreground;
  final Color background;
}

enum _AlertLevel { warning, neutral }
