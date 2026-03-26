// feature/quistions/logic/questions_state.dart
part of 'questions_cubit.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsSuccess extends QuestionsState {
  final QuestionsTestResponse model;

  QuestionsSuccess(this.model);
}

class QuestionsFailure extends QuestionsState {
  final String message;

  QuestionsFailure(this.message);
}
