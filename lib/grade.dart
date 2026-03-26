// grade.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/helper/constance_helper.dart';
import 'package:grade_project/core/helper/extention.dart';
import 'package:grade_project/core/helper/shared_prefrance_helper.dart';
import 'package:grade_project/core/routing/app_router.dart';
import 'package:grade_project/core/routing/routs.dart';
import 'package:grade_project/feature/image%20procesing/imagequbit_cubit.dart';
import 'package:grade_project/feature/thank%20you/thank%20you_screen.dart'
    show ThankYouScreen;
import 'package:sizer/sizer.dart';

class GradeProject extends StatelessWidget {
  final IAppRouter? approuting;

  const GradeProject({super.key,  required this.approuting});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: isLogedInUser
              ? IRouts.riskScreen
              : IRouts.onpordingScreen,
          onGenerateRoute: approuting?.generateRouter,
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ImagequbitCubit()),
              //  BlocProvider(create: (context) => ImagequbitCubit()()),
            ],
            child:
                ThankYouScreen(), // isLogedInUser == true ? ImageIn() : LoginScreen(),
          ),
        );
      },
    );
  }
}

Future<void> checkedLogedIn() async {
  String userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefranceKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLogedInUser = true;
    print(
      "==============user token is $userToken ======is login is {$isLogedInUser}",
    );
  } else {
    isLogedInUser = false;
  }
}
