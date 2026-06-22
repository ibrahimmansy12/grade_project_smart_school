// feature/report/logic/report_cubit.dart
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grade_project/core/helper/constance_helper.dart';
import 'package:grade_project/core/helper/shared_prefrance_helper.dart';
import 'package:grade_project/feature/report/data/weekly_reports_model.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  Future<String> getToken() async {
    return SharedPrefHelper.getSecuredString(SharedPrefranceKeys.userToken);
  }

  Future<String> getuserid() async {
    print(
      "user id: ******${SharedPrefHelper.getSecuredString(SharedPrefranceKeys.userId)}",
    );
    return SharedPrefHelper.getSecuredString(SharedPrefranceKeys.userId);
    // print("user id: ******${SharedPrefHelper.getInt(SharedPrefranceKeys.userId)}");
  }

  Future<WeeklyReportsModel> getReports() async {
    try {
      emit(Reportloading());
      int? id = int.parse(await getuserid());
      print("user id:99999 ******$id");
      print('2222222$baseUrl/Report/$id');
      final url = '$baseUrl/Report/$id';
      final token = await getToken();

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      var dio = Dio();
      var response = await dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
          receiveTimeout: const Duration(seconds: 25),
          sendTimeout: const Duration(seconds: 20),
        ),
      );
      final raw = response.data ?? {};
      print("report raw: ******$raw");
      final model = WeeklyReportsModel.fromJson(raw);

      emit(ReportSucess(reportItems: model.result));
      print(json.encode(response.data));
      return model;
    } catch (e) {
      print("report error: ******$e");
      emit(ReportFailure(errorMessage: e.toString()));
      throw Exception('Failed to load reports: $e');
    }
  }
}/**
 final token = await getToken();
      final url = '$baseUrl/quizzes/$testId';

var headers = {
  'Authorization': 'Bearer $token',
  'Content-Type': 'application/json',
};
var dio = Dio();
var response = await dio.request(
  url,
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
}
else {
  print(response.statusMessage);
} */