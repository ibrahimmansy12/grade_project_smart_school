// feature/login/logic/login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grade_project/core/helper/constance_helper.dart';
import 'package:grade_project/core/helper/shared_prefrance_helper.dart';
import 'package:grade_project/core/networking/dio_factory.dart';
import 'package:grade_project/feature/login/data/model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  /// POSTs credentials to `http://pixel-vision.runasp.net/api/user/login`.
  /// Emits `LoginLoading`, then `LoginSuccess` or `LoginFailure`.
  /// Returns the parsed `LoginResponse` on success, or `null` on failure.
  Future<LoginResponse?> login({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 25),
          headers: {'Content-Type': 'application/json'},
        ),
      );

      final resp = await dio.post(
        'http://pixel-vision.runasp.net/api/user/login',
        data: {'userName': userName, 'password': password},
      );

      final status = resp.statusCode ?? 0;
      if (status >= 100) {
        final data = resp.data is Map<String, dynamic>
            ? resp.data as Map<String, dynamic>
            : Map<String, dynamic>.from(resp.data as Map);

        final model = LoginResponse.fromJson(data);

        if (model.isSuccess && model.result != null) {
          print('+++++++++++++++++++++++++++++${model.result!.token}');
setToken(model.result!.token);
          emit(
            LoginSuccess(
              message: model.result!.message,
              token: model.result!.token,
            ),
          );
        } else {
          final errors = model.errorMessages;
          final msg = (errors != null && errors.isNotEmpty)
              ? errors.join(', ')
              : 'Login failed';
          emit(LoginFailure(msg));
        }

        return model;
      } else {
        final msg =
            '+++++++++++++++++++++++++++++Server error: $status - ${resp.data}';
        emit(LoginFailure(msg));
        return null;
      }
    } catch (e) {
      String msg;
      if (e is DioException && e.response != null) {
        final r = e.response!;
        msg = 'ككككككككككككDio error: ${e.message} - ${r.statusCode} ${r.data}';
      } else if (e is DioException) {
        msg = 'ججججججججججججججججججDio error: ${e.message}';
      } else {
        msg = e.toString();
      }
      emit(LoginFailure(msg));
      return null;
    }
  }
  Future<void> setToken(String token) async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefranceKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
  // Convenience emitters in case callers want to control state directly
  void logInStarted() => emit(LoginLoading());

  void logInSuccess({required String message, required String token}) =>
      emit(LoginSuccess(message: message, token: token));

  void logInFailure(String message) => emit(LoginFailure(message));
}
