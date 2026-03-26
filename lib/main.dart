// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/helper/bloc_observer.dart';
import 'package:grade_project/core/routing/app_router.dart';
import 'package:grade_project/grade.dart';

void main() async {
  // تهيئة Flutter قبل أي عملية async
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AddBlocObserver();
  await checkedLogedIn();
  runApp(GradeProject(approuting: IAppRouter()));
}
