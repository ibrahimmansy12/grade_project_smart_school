// core/routing/app_router.dart
import 'package:flutter/material.dart';
import 'package:grade_project/core/routing/routs.dart';
import 'package:grade_project/feature/image%20procesing/image_analysis_model.dart';
import 'package:grade_project/feature/image%20procesing/image_in.dart';
import 'package:grade_project/feature/image%20procesing/image_out.dart';
import 'package:grade_project/feature/image%20reports/ui/image_reports_screen.dart';
import 'package:grade_project/feature/login/ui/login_screen.dart';
import 'package:grade_project/feature/notification/ui/notification_screen.dart';
import 'package:grade_project/feature/onpord/ui/onpord_screen.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/home_select/ui/home_select_screen.dart';
import 'package:grade_project/feature/parent%20pages/welcome%20back/ui/welcome_back_screen.dart';
import 'package:grade_project/feature/quistions/ui/2ans/questions2ans_screen.dart';
import 'package:grade_project/feature/repeted/ui/repeted_screen.dart';
import 'package:grade_project/feature/report%20with%20date/report2_screen.dart';
import 'package:grade_project/feature/report/ui/report_screen.dart';
import 'package:grade_project/feature/risk/ui/risk_screen.dart';
import 'package:grade_project/feature/sellect%20roll/ui/select_role_screen.dart';
import 'package:grade_project/feature/setting/ui/setting_screen.dart';
import 'package:grade_project/feature/thank%20you/thank%20you_screen.dart';
import 'package:grade_project/feature/welcome%20back/ui/welcome%20back2/welcom3/welcome3_screen.dart';
import 'package:grade_project/feature/welcome%20back/ui/welcome%20back2/welcome_back2.dart';
import 'package:grade_project/feature/welcome%20back/ui/welcome_back.dart';

class IAppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case IRouts.onpordingScreen:
        return MaterialPageRoute(builder: (_) => const OnpordScreen());

      case IRouts.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case IRouts.selectRoleScreen:
        return MaterialPageRoute(builder: (_) => const SelectRoleScreen());

      case IRouts.homeSelectScreen:
        return MaterialPageRoute(builder: (_) => const HomeSelectScreen());

      case IRouts.welcomeBackPage:
        return MaterialPageRoute(builder: (_) => const WelcomeBackPage());

      case IRouts.welcomeBack2Page:
        return MaterialPageRoute(builder: (_) => const WelcomeBack2Page());

      case IRouts.welcome3Screen:
        return MaterialPageRoute(builder: (_) => const Welcome3Screen());

      case IRouts.parentWelcomeBackScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeBackScreen());

      case IRouts.repeteScreen:
        return MaterialPageRoute(builder: (_) => const RepetedScreen());

      case IRouts.riskScreen:
        return MaterialPageRoute(builder: (_) => const RiskScreen());

      case IRouts.reportScreen:
        return MaterialPageRoute(builder: (_) => const ReportScreen());

      case IRouts.report2Screen:
        return MaterialPageRoute(builder: (_) => const Report2Screen());

      case IRouts.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());

      case IRouts.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      case IRouts.imageReportsScreen:
        return MaterialPageRoute(builder: (_) => const ImageReportsScreen());

      case IRouts.imageInScreen:
        return MaterialPageRoute(builder: (_) => const ImageIn());

      case IRouts.imageOutScreen:
        final args = settings.arguments;
        final result = args is ImageAnalyzeResult ? args : null;
        return MaterialPageRoute(builder: (_) => ImageOut(result: result));

      case IRouts.thankYouScreen:
        return MaterialPageRoute(builder: (_) => const ThankYouScreen());

      case IRouts.questionsScreen:
        final args = settings.arguments;
        final onNext = args is VoidCallback ? args : null;
        return MaterialPageRoute(
          builder: (_) => QuestionsScreen2ans(onNextTap: onNext),
        );

      default:
        return null;
    }
  }
}

// Backward-compatible alias so both IAppRouter and MyAppRouter work.
class MyAppRouter extends IAppRouter {}
