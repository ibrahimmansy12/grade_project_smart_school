// feature/report/logic/report_state.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// feature/report/logic/report_state.dart
part of 'report_cubit.dart';

abstract class ReportState {}
class ReportInitial extends ReportState {}
class Reportloading extends ReportState {}

class ReportFailure extends ReportState {
  final String errorMessage;

  ReportFailure({required this.errorMessage});
}
class ReportSucess extends ReportState {
   ReportSucess({
    this.reportItems,
  });
  final StudentWeeklyReport? reportItems;
 

  }
