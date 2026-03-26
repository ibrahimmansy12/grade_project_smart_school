// feature/quistions/logic/questions_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grade_project/core/helper/constance_helper.dart';
import 'package:grade_project/core/helper/shared_prefrance_helper.dart';
import 'package:grade_project/feature/quistions/data/model/questions_test_model.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit({Dio? dio}) : _dio = dio ?? Dio(), super(QuestionsInitial());

  final Dio _dio;

  static const String _baseUrl = 'http://pixel-vision.runasp.net/api';

  // Takes a test id and returns the parsed model from API response.
  Future<QuestionsTestResponse?> getQuestionsById(int testId) async {
    emit(QuestionsLoading());

    try {
      final token = await getToken();

      final response = await _dio.get(
        '$_baseUrl/test/$testId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token.isNotEmpty) 'Authorization': 'Bearer $token',
          },
          receiveTimeout: const Duration(seconds: 25),
          sendTimeout: const Duration(seconds: 20),
        ),
      );

      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        const message = 'Unexpected response format';
        emit(QuestionsFailure(message));
        return null;
      }

      final model = QuestionsTestResponse.fromJson(raw);

      if (model.isSuccess && model.result != null) {
        emit(QuestionsSuccess(model));
      } else {
        final errors = model.errorMessages;
        final message = (errors != null && errors.isNotEmpty)
            ? errors.join(', ')
            : 'Failed to load questions';
        emit(QuestionsFailure(message));
      }

      return model;
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final message =
          'Dio error: ${e.message}${status != null ? ' ($status)' : ''}${data != null ? ' - $data' : ''}';
      emit(QuestionsFailure(message));
      return null;
    } catch (e) {
      final message = e.toString();
      emit(QuestionsFailure(message));
      return null;
    }
  }

  Future<String> getToken() async {
    return SharedPrefHelper.getSecuredString(SharedPrefranceKeys.userToken);
  }

  /// Get total count of options from the API response
  int getOptionsCount() {
    if (state is QuestionsSuccess) {
      final successState = state as QuestionsSuccess;
      return successState.model.result?.totalOptionsCount ?? 0;
    }
    return 0;
  }
}
