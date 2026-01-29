// feature/report/ui/report_screen.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/spacing.dart';
import 'package:grade_project/feature/risk/ui/risk_screen.dart';
import 'package:sizer/sizer.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
                Text(
                  'Reports',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 3.h),

                // Toggle (Weekly / Monthly) -> TabBar (pill segmented control)
                DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 6.h,
                        padding: EdgeInsets.all(0.5.sp),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(55, 101, 114, 125),
                          borderRadius: BorderRadius.circular(26.sp),
                        ),
                        child: TabBar(
                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Color(0xFF2E6EB3),
                            borderRadius: BorderRadius.circular(26.sp),
                          ),
                          indicatorPadding: EdgeInsets.symmetric(
                            horizontal: 0.6.w,
                            vertical: 0.2.h,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Color.fromARGB(255, 44, 51, 62),
                          labelStyle: TextStyle(
                            fontSize: 19.sp,
                            // fontWeight: FontWeight.w400,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 19.sp,
                            // color: Colors.black,
                            // fontWeight: FontWeight.w400,
                          ),
                          tabs: [
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                child: Text(
                                  'Weekly',
                                  // style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                child: Text('Monthly'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),

                SizedBox(height: 2.h),

                // Date row + download
                DateDownloadPdf(),

                verticalSpace(2),
                // Overview card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmailysColumn(),
                      // SizedBox(height: 2.h),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           '17',
                      //           style: TextStyle(
                      //             fontSize: 20.sp,
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //         SizedBox(height: 0.5.h),
                      //         Text(
                      //           'Total Alerts',
                      //           style: TextStyle(
                      //             fontSize: 12.sp,
                      //             color: Colors.black54,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           '4',
                      //           style: TextStyle(
                      //             fontSize: 20.sp,
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //         SizedBox(height: 0.5.h),
                      //         Text(
                      //           'Resolved',
                      //           style: TextStyle(
                      //             fontSize: 12.sp,
                      //             color: Colors.black54,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           '3',
                      //           style: TextStyle(
                      //             fontSize: 20.sp,
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //         SizedBox(height: 0.5.h),
                      //         Text(
                      //           'Escalated',
                      //           style: TextStyle(
                      //             fontSize: 12.sp,
                      //             color: Colors.black54,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 2.h),
                      _groupedBarChart(),
                      verticalSpace(3),
                      Text(
                        "Recent Allerts",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Alerts list
                      Column(
                        children: [
                          _alertItem(
                            Icons.priority_high,
                            Colors.orange.shade100,
                            'Repeated aggression',
                            context,
                          ),
                          SizedBox(height: 1.h),
                          _alertItem(
                            Icons.mood_bad,
                            Colors.green.shade100,
                            'Low engagement in class',
                            context,
                          ),
                          SizedBox(height: 1.h),
                          _alertItem(
                            Icons.sentiment_dissatisfied,
                            Colors.yellow.shade100,
                            'Smokie withdrawal',
                            context,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _groupedBarChart() {
    final double chartHeight = 16.h;
    return SizedBox(
      height: chartHeight + 4.2.h,
      child: Stack(
        children: [
          NumbersColumns(chartHeight: chartHeight),
          Positioned(
            bottom: 1.h,
            top: 2.h,
            left: 0,
            right: 0,
            child: AggressionRow(chartHeight: chartHeight),
          ),
        ],
      ),
    );
  }

  Widget _alertItem(
    IconData icon,
    Color bg,
    String title,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.orange.shade700, size: 6.w),
            ),
            SizedBox(width: 3.w),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Icon(Icons.chevron_right, color: Colors.black26, size: 16.sp),
          ],
        ),
      ),
    );
  }
}

class NumbersColumns extends StatelessWidget {
  const NumbersColumns({super.key, required this.chartHeight});

  final double chartHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Y axis labels
        SizedBox(
          height: chartHeight - 2.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpace(2),
              Text(
                '36',
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
              Text(
                '24',
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
              Text(
                '12',
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
              Text(
                '0',
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
            ],
          ),
        ),
        horezontalSpace(4),
        // Chart area with gridlines and groups
        Expanded(
          child: SizedBox(
            height: chartHeight - 4.h,
            child: Column(
              children: List.generate(
                4,
                (_) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AggressionRow extends StatelessWidget {
  const AggressionRow({super.key, required this.chartHeight});

  final double chartHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Group 1 (Aggression)
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 7.w,
                  height: chartHeight * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                Container(
                  width: 7.w,
                  height: chartHeight * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade200,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                Container(
                  width: 7.w,
                  height: chartHeight * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            SizedBox(
              // width: 24.w,
              child: Text(
                'Aggression\nissue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
            ),
          ],
        ),
        horezontalSpace(3),
        // Group 2 (Engagement)
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 7.w,
                  height: chartHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                Container(
                  width: 7.w,
                  height: chartHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade200,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                Container(
                  width: 7.w,
                  height: chartHeight * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            SizedBox(
              // width: 28.w,
              child: Text(
                'Engagement\nin class',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}

class EmailysColumn extends StatelessWidget {
  const EmailysColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Emilys Overview',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
        verticalSpace(1),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 199, 115),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: Text(
            'MEDIUM RISK',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 251, 247, 238),
            ),
          ),
        ),
      ],
    );
  }
}

class DateDownloadPdf extends StatelessWidget {
  const DateDownloadPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        horezontalSpace(1),
        Text(
          'Apr 17 - Apr 23',
          style: TextStyle(fontSize: 20.sp, color: Colors.black87),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 0.5.w),
            color: Colors.white.withOpacity(0),
            borderRadius: BorderRadius.circular(18.sp),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon(
              //   Icons.download,
              //   size: 14.sp,
              //   color: Colors.black54,
              // ),
              // SizedBox(width: 2.w),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RiskScreen()),
                  );
                },
                child: Text(
                  'Download PDF',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
