// feature/notification/notification_screen.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_NotificationItem> todayItems = [
      const _NotificationItem(
        title: 'class entering',
        level: _NotificationLevel.success,
      ),
      const _NotificationItem(
        title: 'Low engagement in class',
        level: _NotificationLevel.neutral,
        hasArrow: true,
      ),
      const _NotificationItem(
        title: 'Sleeping in class',
        level: _NotificationLevel.neutral,
        hasArrow: true,
      ),
      const _NotificationItem(
        title: 'Repeated aggression',
        level: _NotificationLevel.warning,
        hasArrow: true,
      ),
      const _NotificationItem(
        title: 'Low engagement in class',
        level: _NotificationLevel.neutral,
        hasArrow: true,
      ),
      const _NotificationItem(
        title: 'class leaving',
        level: _NotificationLevel.neutral,
      ),
    ];

    final List<_NotificationItem> yesterdayItems = [
      const _NotificationItem(
        title: 'class entering',
        level: _NotificationLevel.success,
      ),
      const _NotificationItem(
        title: 'Low engagement in class',
        level: _NotificationLevel.neutral,
        hasArrow: true,
      ),
      const _NotificationItem(
        title: 'Sleeping in class',
        level: _NotificationLevel.neutral,
        hasArrow: true,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.8.h),
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 30.sp,
                  color: const Color(0xFF4A4A4A),
                ),
              ),
              SizedBox(height: 1.8.h),
              Text(
                'notifications',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF181818),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 1.8.h),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const _DateDivider(label: 'today'),
                    SizedBox(height: 1.2.h),
                    ...todayItems
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: _NotificationCard(item: item),
                          ),
                        )
                        .toList(),
                    SizedBox(height: 0.4.h),
                    const _DateDivider(label: 'yesterday'),
                    SizedBox(height: 1.2.h),
                    ...yesterdayItems
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: _NotificationCard(item: item),
                          ),
                        )
                        .toList(),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: const Color(0xFFD5D5D5))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Text(
            label,
            style: TextStyle(
              color: const Color(0xFF9B9B9B),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Container(height: 1, color: const Color(0xFFD5D5D5))),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    final _NotificationPalette palette = _paletteFor(item.level);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.55.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F8),
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
              size: 15.sp,
              color: palette.foreground,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1C1C1C),
                letterSpacing: -0.1,
              ),
            ),
          ),
          if (item.hasArrow)
            Icon(
              Icons.chevron_right_rounded,
              size: 22.sp,
              color: const Color(0xFF7A7A7A),
            ),
        ],
      ),
    );
  }

  _NotificationPalette _paletteFor(_NotificationLevel level) {
    switch (level) {
      case _NotificationLevel.success:
        return const _NotificationPalette(
          foreground: Color(0xFF109545),
          background: Color(0xFFDDF8E8),
        );
      case _NotificationLevel.warning:
        return const _NotificationPalette(
          foreground: Color(0xFFCF8206),
          background: Color(0xFFFFEBCB),
        );
      case _NotificationLevel.neutral:
        return const _NotificationPalette(
          foreground: Color(0xFF727272),
          background: Color(0xFFE8E8E8),
        );
    }
  }
}

class _NotificationItem {
  const _NotificationItem({
    required this.title,
    required this.level,
    this.hasArrow = false,
  });

  final String title;
  final _NotificationLevel level;
  final bool hasArrow;
}

class _NotificationPalette {
  const _NotificationPalette({
    required this.foreground,
    required this.background,
  });

  final Color foreground;
  final Color background;
}

enum _NotificationLevel { success, neutral, warning }
