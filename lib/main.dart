// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/helper/bloc_observer.dart';
import 'package:grade_project/core/helper/constance_helper.dart';
import 'package:grade_project/core/helper/extention.dart';
import 'package:grade_project/core/helper/shared_prefrance_helper.dart';
import 'package:grade_project/feature/image%20procesing/image_in.dart';
import 'package:grade_project/feature/image%20procesing/imagequbit_cubit.dart';
import 'package:grade_project/feature/login/ui/login_screen.dart';
import 'package:grade_project/feature/onpord/get_started_screen.dart';
import 'package:grade_project/feature/sellect%20roll/ui/select_role_screen.dart';
import 'package:sizer/sizer.dart';

void main() async {
  // تهيئة Flutter قبل أي عملية async
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AddBlocObserver();
  await checkedLogedIn();
  runApp(const GradeProject());
}

class GradeProject extends StatelessWidget {
  const GradeProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ImagequbitCubit()),
              //  BlocProvider(create: (context) => ImagequbitCubit()()),
            ],
            child:GetStartedScreen()// isLogedInUser == true ? ImageIn() : LoginScreen(),
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
