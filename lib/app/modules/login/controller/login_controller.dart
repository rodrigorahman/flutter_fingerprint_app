import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fingerprint_app/app/exceptions/user_not_found_exception.dart';
import 'package:flutter_fingerprint_app/app/shared/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_fingerprint_app/app/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';
part 'login_state.dart';

@Injectable(singleton: false)
class LoginController extends Cubit<LoginState> {
  LoginRepository _repository;

  LoginController(
    this._repository,
  ) : super(LoginInitial());

  Future<void> login(String login, String password) async {
    try {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));
      final token = await _repository.login(login, password);
      if (token != null) {
        final sp = await SharedPreferences.getInstance();
        sp.setString(LOGGED_KEY, token);
        emit(LoginSuccess());
      }
    } on UserNotFoundException {
      emit(LoginError('Login ou senha inválidos'));
    } catch (e) {
      print(e);
      emit(LoginError('Erro ao realizar login'));
    }
  }
}
